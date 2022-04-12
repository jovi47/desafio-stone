defmodule BuyService do
  alias BuyService.{Validator}

  def apportion_payment_based_on_buys(emails_directory, buys_directory) do
    emails = Validator.json_file(emails_directory)
    buys = Validator.json_file(buys_directory)
    apportion_payment_for_each(emails, buys)
  end

  defp apportion_payment_for_each({:ok, emails}, {:ok, buys}) do
    email_list =
      emails
      |> Map.get("emails")

    amount_to_pay =
      buys
      |> Map.get("buys")
      |> total_amount()

    apportion_payment(email_list, amount_to_pay)
  end

  defp apportion_payment_for_each({:error, reason}, {_ok, _result}),
    do: {:error, "First File | #{reason}"}

  defp apportion_payment_for_each({_ok, _result}, {:error, reason}),
    do: {:error, "Second File | #{reason}"}

  defp total_amount(buys) do
    Enum.map(buys, & &1["items"])
    |> Enum.reduce([], fn x, acc -> Enum.concat(x, acc) end)
    |> Enum.map(&round(&1["price"] * &1["quantity"]))
    |> Enum.sum()
  end

  defp apportion_payment({:error, reason}, _amount_to_pay), do: {:error, reason}

  defp apportion_payment(emails, amount_to_pay) do
    remainder = amount_to_pay |> rem(length(emails))
    amount_for_each = (amount_to_pay - remainder) |> div(length(emails))

    emails
    |> Enum.reduce(%{}, fn email, thisMap -> Map.put(thisMap, email, amount_for_each) end)
    |> Map.put(hd(emails), amount_for_each + remainder)
  end
end
