defmodule BuyService do
  def apportion_payment_based_on_buys(emails_directory, buys_directory) do
    emails = emails_directory |> get_emails()
    amount_to_pay = buys_directory |> get_amount_to_pay()
    remainder = amount_to_pay |> rem(length(emails))
    amount_for_each = (amount_to_pay - remainder) |> div(length(emails))

    emails
    |> Enum.reduce(%{}, fn email, thisMap -> Map.put(thisMap, email, amount_for_each) end)
    |> Map.put(hd(emails), amount_for_each + remainder)
  end

  defp get_emails(directory) do
    File.read(directory)
    |> handle_file_read()
    |> get_emails_from_json()
  end

  defp get_emails_from_json(json) do
    Jason.decode(json)
    |> handle_json_read()
    |> Map.get("emails")
  end

  defp get_amount_to_pay(directory) do
    File.read(directory)
    |> handle_file_read()
    |> get_amount_to_pay_from_json()
  end

  defp get_amount_to_pay_from_json(json) do
    Jason.decode(json)
    |> handle_json_read()
    |> Map.get("buys")
    |> Enum.map(& &1["items"])
    |> Enum.reduce([], fn x, acc -> Enum.concat(x, acc) end)
    |> Enum.map(&round(&1["price"] * &1["quantity"]))
    |> Enum.sum()
  end

  defp handle_json_read({:error, reason}), do: {:error, reason}
  defp handle_json_read({:ok, result}), do: result

  defp handle_file_read({:ok, result}), do: result
  defp handle_file_read({:error, reason}), do: {:error, "File not founded #{reason}"}
end
