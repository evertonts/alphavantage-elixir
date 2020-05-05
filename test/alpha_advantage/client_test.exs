defmodule AlphaAdvatage.ClientTest do
  use ExUnit.Case, async: true

  alias AlphaAdvantage.Client

  test "test" do
    assert %{"Global Quote" => %{"01. symbol" => symbol, "05. price" => price}} =
             Client.get!("GLOBAL_QUOTE", "symbol=IBM")

    assert "IBM" = symbol
  end
end
