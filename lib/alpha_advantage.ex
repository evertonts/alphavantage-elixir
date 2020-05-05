defmodule AlphaAdvantage do
  @moduledoc """
  Documentation for `AlphaAdvantage`.
  """

  alias AlphaAdvantage.{Client, SymbolSearch}

  def symbol_search(client \\ Client, code) do
    %{"bestMatches" => matches} = client.get!("SYMBOL_SEARCH", "keywords=#{code}")

    Enum.map(matches, fn result ->
      %SymbolSearch{
        symbol: result["1. symbol"],
        name: result["2. name"],
        type: result["3. type"],
        region: result["4. region"],
        market_open: result["5. marketOpen"],
        market_close: result["6. marketClose"],
        timezone: result["7. timezone"],
        currency: result["8. currency"],
        matchScore: result["9. matchScore"]
      }
    end)
  end
end
