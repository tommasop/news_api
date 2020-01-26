defmodule NewsApi.TopHeadlines do
  import TopHeadlines.Params
  import NewsApi.Base
  @url_part "/top-headlines"

  def search(params, api_key \\ :global) do
    case check(params) do
      {:ok, params} ->
        get(@url_part, api_key, struct(TopHeadlines.Params, params))

      {:error, error} ->
        error
    end
  end
end
