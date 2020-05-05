defmodule AlphaAdvantageTest do
  use ExUnit.Case
  doctest AlphaAdvantage

  import Mox

  alias AlphaAdvantage.ClientBehavior

  describe "symbol_search" do
    test "returns the best mathces" do
      defmock(MockClient, for: ClientBehavior)

      expect(MockClient, :get!, fn _, _ ->
        %{"bestMatches" => [%{"1. symbol" => "ITSA4.SAO", "2. name" => "Itausa"}]}

        assert [%{symbol: "ITSA4.SAO", name: "Itausa"}] = AlphaAdvantage.symbol_search(MockClient, "itsa4")
      end)
    end
  end
end
