defmodule AlphaAdvantage.SymbolSearch do
  defstruct [
    :symbol,
    :name,
    :type,
    :region,
    :market_open,
    :market_close,
    :timezone,
    :currency,
    :matchScore
  ]
end
