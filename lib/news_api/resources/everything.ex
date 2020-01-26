defmodule NewsApi.Everything do
  import NewsApi.Base
  @url_part "/everything"

  def search(params, api_key \\ :global) do
    get(@url_part, api_key, params)
  end
end
