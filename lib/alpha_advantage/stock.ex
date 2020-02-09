defmodule AlphaAdvantage.Stock do
  alias AlphaAdvantage.Client

  @doc """
  Returns the last price for the specified stock

  AlphaAdvantage.Stock.last_price("")

  """
  def last_price(client // Client, code) do
  end

  @doc """
  Returns the last price and volume information for the given stock

  AlphaAdvantage.Stock.global_quote("AAPL")
    => {:ok, Map.t} || {:error, String.t}

  """
  def global_quote(client // Client, code) do
    response = client.get!("GLOBAL_QUOTE", code)
  end
end
