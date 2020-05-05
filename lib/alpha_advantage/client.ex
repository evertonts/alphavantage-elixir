defmodule AlphaAdvantage.Client do
  @behaviour AlphaAdvantageClientBehavior

  @spec get!(String.t(), String.t()) :: Map.t()
  def get!(function, params) do
    response =
      HTTPoison.get!(
        "#{endpoint()}/query?function=#{function}&apikey=#{api_key()}&#{params}"
      )

    response.body
    |> Jason.decode!()
  end

  defp api_key do
    Application.get_env(:alpha_advantage, :alpha_advantage_api_key)
  end

  defp endpoint do
    Application.get_env(:alpha_advantage, :alpha_advantage_endpoint) ||
      "https://www.alphavantage.co"
  end
end
