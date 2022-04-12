defmodule BuyServiceTest do
  use ExUnit.Case
  doctest BuyService

  describe "apportion_payment_based_on_buys/2" do
    test "when everything goes right, returns the map" do
      expected_result = %{
        "deiasousavieira@gmail.com" => 415_919,
        "joaninha@outlook.com.br" => 415_919,
        "jovi47profissional@gmail.com" => 415_923,
        "opedrindoquartel@gmail.com.br" => 415_919,
        "paodebatata@yahoo.com.br" => 415_919
      }

      assert BuyService.apportion_payment_based_on_buys(
               "./test/mocks/emails.json",
               "./test/mocks/buys.json"
             ) ==
               expected_result
    end

    test "when the first or second files are invalid returns checks error" do
      expected_error_first_file = {:error, "First File | Error while checking file: enoent"}

      assert BuyService.apportion_payment_based_on_buys(
               "not_exists.json",
               "./test/mocks/buys.json"
             ) ==
               expected_error_first_file

      expected_error_second_file = {:error, "Second File | Error while checking file: enoent"}

      assert BuyService.apportion_payment_based_on_buys(
               "./test/mocks/emails.json",
               "not_exists.json"
             ) ==
               expected_error_second_file
    end

    test "when the first or second jsons are invalid, returns parse error" do
      expected_error_first_json =
        {:error,
         "First File | A error ocurred when parsing JSON, check sintax at: https://jsonformatter.curiousconcept.com"}

      assert BuyService.apportion_payment_based_on_buys(
               "./test/mocks/invalid_emails_sintax.json",
               "./test/mocks/buys.json"
             ) ==
               expected_error_first_json

      expected_error_second_json =
        {:error,
         "Second File | A error ocurred when parsing JSON, check sintax at: https://jsonformatter.curiousconcept.com"}

      assert BuyService.apportion_payment_based_on_buys(
               "./test/mocks/emails.json",
               "./test/mocks/invalid_buys_sintax.json"
             ) ==
               expected_error_second_json
    end

  end
end
