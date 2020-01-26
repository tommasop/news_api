defmodule NewsApi.Sources do
  import NewsApi.Base
  @url_part "/sources"

  def search(params, api_key \\ :global) do
    get(@url_part, api_key, struct(Sources.Params, params))
  end
end
