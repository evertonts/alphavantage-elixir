defmodule AlphaAdvatage.ClientTest do
  use ExUnit.Case, async: true

  alias AlphaAdvantage.Client

  @moduletag :alpha_advantage_api

  setup_all do
    api_key = Application.get_env(:alpha_advantage, :alpha_advantage_api_key)
    Application.put_env(:alpha_advantage, :alpha_advantage_api_key, "demo")

    on_exit fn -> Application.put_env(:alpha_advantage, :alpha_advantage_api_key, api_key) end
  end

  test "test" do
    assert %{ "Global Quote" => %{ "01. symbol" => symbol, "05. price" => price } } = Client.get("GLOBAL_QUOTE", "MSFT")
    assert "MSFT" = symbol
    assert "183.8900" = price
  end
end
