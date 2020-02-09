defmodule AlphaAdvantage.StockTest do
  use ExUnit.Case, async: true

  import Mox

  alias AlphaAdvantage.{Stock, ClientBehavior, GlobalQuote}

  describe "global_quote" do
    test "it returns the formatted Alpha Advantage Global Quote" do
      defmock(MockClient, for: ClientBehavior)

      expect(MockClient, :get!, fn _, _ ->
        %{"Global Quote" => %{"01. symbol" => "MSFT", "05. price" => "183.8900"}}
      end)

      assert %GlobalQuote{
               symbol: "MSFT",
               price: "183.8900"
             } = Stock.global_quote(MockClient, "MSFT")
    end
  end

  describe "last_price" do
    test "returns the last price for the given stock" do
      defmock(MockClient, for: ClientBehavior)

      expect(MockClient, :get!, fn _, _ ->
        %{"Global Quote" => %{"05. price" => "183.8900"}}
      end)

      assert "183.8900" = Stock.last_price(MockClient, "MSFT")
    end
  end
end
