defmodule NewsApi.TopHeadlines do
  import NewsApi.Base
  @url_part "/top-headlines"

  def search(params, api_key \\ :global) do
    get(@url_part, api_key, struct(TopHeadlines.Params, params))
  end
end
