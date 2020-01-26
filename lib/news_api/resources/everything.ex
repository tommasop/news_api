defmodule NewsApi.Everything do
  import Everything.Params
  import NewsApi.Base
  @url_part "/everything"

  def search(params, api_key \\ :global) do
    case check(params) do
      {:ok, params} ->
        get(@url_part, api_key, struct(Everything.Params, params))

      {:error, error} ->
        error
    end
  end
end
