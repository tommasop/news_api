defmodule NewsApi.Everything do
  import Everything.Params
  import NewsApi.Base
  @url_part "/everything"

  @doc """
  Searches all the news with available parameters.

  q: Keywords or phrases to search for in the article title and body.

  Advanced search is supported here:

    Surround phrases with quotes (") for exact match.
    Prepend words or phrases that must appear with a + symbol. Eg: +bitcoin
    Prepend words that must not appear with a - symbol. Eg: -bitcoin
    Alternatively you can use the AND / OR / NOT keywords, and optionally group these with parenthesis. Eg: crypto AND (ethereum OR litecoin) NOT bitcoin.

  The complete value for q must be URL-encoded.

  qInTitle: Keywords or phrases to search for in the article title only.

  Advanced search is supported here:

    Surround phrases with quotes (") for exact match.
    Prepend words or phrases that must appear with a + symbol. Eg: +bitcoin
    Prepend words that must not appear with a - symbol. Eg: -bitcoin
    Alternatively you can use the AND / OR / NOT keywords, and optionally group these with parenthesis. Eg: crypto AND (ethereum OR litecoin) NOT bitcoin.

  The complete value for qInTitle must be URL-encoded.

  sources: A comma-seperated string of identifiers (maximum 20) for the news sources or blogs you want headlines from. Use the /sources endpoint to locate these programmatically or look at the sources index.

  domains: A comma-seperated string of domains (eg bbc.co.uk, techcrunch.com, engadget.com) to restrict the search to.

  excludeDomains: A comma-seperated string of domains (eg bbc.co.uk, techcrunch.com, engadget.com) to remove from the results.

  from: A date for the oldest article allowed. This should be in ISO 8601 format (e.g. 2020-01-30) Default: the oldest according to your plan.

  to: A date for the newest article allowed. This should be in ISO 8601 format (e.g. 2020-01-30) Default: the newest according to your plan.

  language: The 2-letter ISO-639-1 code of the language you want to get headlines for. Possible options: ar de en es fr he it nl no pt ru se ud zh. Default: all languages returned.

  sortBy: The order to sort the articles in. Possible options: relevancy, popularity, publishedAt. Default: publishedAt

  pageSize: int The number of results to return per page. 20 is the default, 100 is the maximum.

  page: int Use this to page through the results.

  ## Example
      iex> NewsApi.Everything.search(%{ q: 'bitcoin',
                                      sources: 'bbc-news,the-verge',
                                      domains: 'bbc.co.uk,techcrunch.com',
                                      from: '2017-12-01',
                                      to: '2017-12-12',
                                      language: 'en',
                                      sortBy: 'relevancy',
                                      page: 2}, "your_api_key")
      {:ok,
        {
          "status" =>  "ok",
          "totalResults" =>  3434,
          "articles" =>  [
            %{
              "source" =>  {
                "id" =>  "mashable",
                "name" =>  "Mashable"
              },
              "author" =>  "Stan Schroeder",
              "title" =>  "Bitcoin whale moves $1.1 billion in bitcoins for an $80 fee",
              "description" =>  "Bitcoin hasn't (yet) fulfilled its original promise of being widely-used electronic cash, but it still offers some features that would be hard to achieve within the traditional banking system. Namely, moving $1.1 billion from one address to another, in a sing…",
              "url" =>  "https://mashable.com/article/bitcoin-1-1-billion-transaction/",
              "urlToImage" =>  "https://mondrian.mashable.com/2020%252F01%252F15%252F38%252Fd26e834787934c56a33fdeb39faa0be8.84e34.jpg%252F1200x630.jpg?signature=IHj6xz7nTFxvmjn6XOvUiHKJCIM=",
              "publishedAt" =>  "2020-01-15T09:10:59Z",
              "content" =>  "Bitcoin hasn't (yet) fulfilled its original promise of being widely-used electronic cash, but it still offers some features that would be hard to achieve within the traditional banking system. Namely, moving $1.1 billion from one address to another, in a sing… [+1589 chars]"
            },
            %{
              "source" =>  {
                "id" =>  "techcrunch",
                "name" =>  "TechCrunch"
              },
              "author" =>  "Josh Constine",
              "title" =>  "The crypto rich find security in Anchorage",
              "description" =>  "Not the city, the $57 million-funded cryptocurrency custodian startup. When someone wants to keep tens or hundreds of millions of dollars in Bitcoin, Ethereum, or other coins safe, they put them in Anchorage’s vault. And now they can trade straight from custo…",
              "url" =>  "http://techcrunch.com/2020/01/15/anchorage-trading-from-custody/",
              "urlToImage" =>  "https://techcrunch.com/wp-content/uploads/2020/01/Anchorage-Trading-1.png?w=740",
              "publishedAt" =>  "2020-01-15T11:57:30Z",
              "content" =>  "Not the city, the $57 million-funded cryptocurrency custodian startup. When someone wants to keep tens or hundreds of millions of dollars in Bitcoin, Ethereum, or other coins safe, they put them in Anchorage’s vault. And now they can trade straight from custo… [+3802 chars]"
            },
            %{
              "source" =>  {
                "id" =>  "business-insider",
                "name" =>  "Business Insider"
              },
              "author" =>  "Trista Kelley",
              "title" =>  "No, bitcoin is not the new gold",
              "description" =>  "Bitcoin bulls like to claim that bitcoin is a great haven investment, like gold, in times of geopolitical uncertainty. \"These people ignore all the times that it moves inversely with sentiment,\" says Oanda's Craig Erlam. \"Bitcoin is not gold and certainly not…",
                   "url" =>  "https://markets.businessinsider.com/currencies/news/bitcoin-not-new-gold-price-doesnt-correlate-safe-haven-asset-2020-1-1028798749",
                   "urlToImage" =>  "https://images.markets.businessinsider.com/image/5e145a76855cc2346900f816-2400/shutterstock241760587.jpg",
                   "publishedAt" =>  "2020-01-07T11:19:15Z",
                   "content" =>  "Shutterstock\r\n<ul><li>Bitcoin bulls like to claim that bitcoin is a great haven investment, like gold, in times of geopolitical uncertainty. </li><li>\"These people ignore all the times that it moves inversely with sentiment,\" says Oanda's Craig Erlam.</li><li… [+2002 chars]"
                        },
                   %{
                     "source" =>  {
                       "id" =>  "mashable",
                       "name" =>  "Mashable"
                     },
                     "author" =>  "Jack Morse",
                     "title" =>  "2019 was a phenomenal year for cryptocurrency (scams)",
                     "description" =>  "Bust out the champagne, folks! It's time to celebrate. 2019 was one hell of a year for cryptocurrency. Or, more specifically, cryptocurrency scams. That's according to Chainalysis, a respected blockchain analysis company that works with law enforcement and th…",
                          "url" =>  "https://mashable.com/article/cryptocurrency-crime-ponzi-schemes-2019-report/",
                          "urlToImage" =>  "https://mondrian.mashable.com/2020%252F01%252F29%252Fc8%252F4f6062d2a40343ebbc0acd60e2466265.aa895.jpg%252F1200x630.jpg?signature=Jn5fRIHQU781OBvmtI8btPhDNms=",
                          "publishedAt" =>  "2020-01-29T20:54:18Z",
                          "content" =>  "Bust out the champagne, folks! It's time to celebrate. \r\n2019 was one hell of a year for cryptocurrency. Or, more specifically, cryptocurrency scams. That's according to Chainalysis, a respected blockchain analysis company that works with law enforcement and … [+2253 chars]"
                    }
                ]
              }
          }
  """
  def search(params, api_key \\ :global) do
    case check(params) do
      {:ok, params} ->
        get(@url_part, api_key, struct(Everything.Params, params))

      {:error, error} ->
        error
    end
  end
end
