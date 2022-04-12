defmodule BuyService.Validator do

  def json_file(directory) do
    File.read(directory)
    |> validate_json_file()
  end

  defp validate_json_file({:ok, json}), do: validate_json(json)
  defp validate_json_file({:error, reason}), do: {:error, "Error while checking file: #{reason}"}

  defp validate_json(json) do
    Jason.decode(json)
    |> handle_json()
  end

  defp handle_json({:ok, result}), do: {:ok, result}
  defp handle_json({:error, _reason}), do: {:error,
  "A error ocurred when parsing JSON, check sintax at: https://jsonformatter.curiousconcept.com"}

end
