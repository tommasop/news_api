# NewsApi Elixir client library

Use the unofficial Elixir client library to integrate News API into your Elixir application without worrying about what's going on under the hood.

Source: tommasop/news_api

## Installation

The package can be installed by adding `news_api_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:news_api_ex, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/news_api_ex](https://hexdocs.pm/news_api_ex).

## Usage

```
# /v2/top-headlines
top_headlines = NewsApi.TopHeadlines.search(%{q: 'bitcoin',
                                              sources: 'bbc-news,the-verge',
                                              category: 'business',
                                              language: 'en',
                                              country: 'us'}, "your-api-key")

# /v2/everything
all_articles = NewsApi.Everything.search(%{q: 'bitcoin',
                                           sources: 'bbc-news,the-verge',
                                           domains: 'bbc.co.uk,techcrunch.com',
                                           from: '2017-12-01',
                                           to: '2017-12-12',
                                           language: 'en',
                                           sortBy: 'relevancy',
                                           page: 2}, "your-api-key")

# /v2/sources
sources = NewsApi.Sources.all(%{country: 'us', language: 'en'}, "your-api-key")
```
