defmodule AlphaAdvantage.StockTest do
  use ExUnit.Case, async: true

  import Mox

  alias AlphaAdvantage.{Stock, ClientBehavior, GlobalQuote}

  test "test" do
    defmock(MockClient, for: ClientBehavior)

    expect(MockClient, :get!, fn _, _ ->
      %{ "Global Quote" => %{"01. symbol" => "MSFT", "05. price" => "183.8900" } }
    end)

    assert %GlobalQuote{
      symbol: "MSFT",
      price: "183.8900"
    } = Stock.global_quote(MockClient, "MSFT")
  end
end