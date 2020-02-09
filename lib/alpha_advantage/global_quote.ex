defmodule AlphaAdvantage.GlobalQuote do
  defstruct [
    :symbol,
    :open,
    :high,
    :low,
    :price,
    :volume,
    :latest_trading_day,
    :previous_close,
    :change,
    :change_percent
  ]
end
