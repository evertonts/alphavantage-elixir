defmodule AlphaAdvantage.Stock do
  alias AlphaAdvantage.{Client, GlobalQuote}

  @doc """
  Returns the last price for the specified stock

  AlphaAdvantage.Stock.last_price("")

  """
  def last_price(client \\ Client, code) do
  end

  @doc """
  Returns the last price and volume information for the given stock

  AlphaAdvantage.Stock.global_quote("AAPL")
    => AlphaAdvantage.GlobalQuote

  """
  def global_quote(client \\ Client, code) do
    %{ "Global Quote" => global_quote } = client.get!("GLOBAL_QUOTE", code)

    %GlobalQuote{
      symbol: global_quote["01. symbol"],
      open: global_quote["02. open"],
      high: global_quote["03. high"],
      low: global_quote["04. low"],
      price: global_quote["05. price"],
      volume: global_quote["06. volume"],
      latest_trading_day: global_quote["07. latest trading day"],
      previous_close: global_quote["08. previous close"],
      change: global_quote["09. change"],
      change_percent: global_quote["10. change percent"]
    }
  end
end
