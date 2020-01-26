# NewsApi Elixir client library

Use the unofficial Elixir client library to integrate News API into your Elixir application without worrying about what's going on under the hood.

Source: tommasop/news_api

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `news_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:news_api, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/news_api](https://hexdocs.pm/news_api).

## Usage

require 'news-api'

## Init

```
newsapi = News.new("API_KEY")             

# /v2/top-headlines
top_headlines = newsapi.get_top_headlines(q: 'bitcoin',
                                          sources: 'bbc-news,the-verge',
                                          category: 'business',
                                          language: 'en',
                                          country: 'us')

# /v2/everything
all_articles = newsapi.get_everything(q: 'bitcoin',
                                      sources: 'bbc-news,the-verge',
                                      domains: 'bbc.co.uk,techcrunch.com',
                                      from: '2017-12-01',
                                      to: '2017-12-12',
                                      language: 'en',
                                      sortBy: 'relevancy',
                                      page: 2))

# /v2/sources
sources = newsapi.get_sources(country: 'us', language: 'en')
```
