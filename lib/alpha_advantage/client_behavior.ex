defmodule AlphaAdvantage.ClientBehavior do
  @callback get!(String.t(), String.t()) :: Map.t()
end
