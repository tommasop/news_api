defmodule NewsApi.TopHeadlines do
  import TopHeadlines.Params
  import NewsApi.Base
  @url_part "/top-headlines"

  @doc """
  Searches the top headlines with available parameters

  country: The 2-letter ISO 3166-1 code of the country you want to get headlines for. Possible options: ae ar at au be bg br ca ch cn co cu cz de eg fr gb gr hk hu id ie il in it jp kr lt lv ma mx my ng nl no nz ph pl pt ro rs ru sa se sg si sk th tr tw ua us ve za . Note: you can't mix this param with the sources param.

  category: The category you want to get headlines for. Possible options: business entertainment general health science sports technology . Note: you can't mix this param with the sources param.

  sources: A comma-seperated string of identifiers for the news sources or blogs you want headlines from. Use the /sources endpoint to locate these programmatically or look at the sources index. Note: you can't mix this param with the country or category params.

  q: Keywords or a phrase to search for.

  pageSize: int The number of results to return per page (request). 20 is the default, 100 is the maximum.

  page: int Use this to page through the results if the total results found is greater than the page size.

  ## Example
      iex> NewsApi.TopHeadlines.search(%{ q: 'bitcoin',
                                          sources: 'bbc-news,the-verge',
                                          category: 'business',
                                          language: 'en',
                                          country: 'us'}, "your_api_key")
      {:ok,
        %{
          "status" => "ok",
          "totalResults" => 38,
          "articles" => [
           %{
            "source" => %{
                "id" => nil,
                "name" => "Investors.com"
            },
            "author" => "Investor's Business Daily",
            "title" => "Dow Jones Today, Futures Dive On Fed, Coronavirus Risk; Microsoft, Qorvo, Lam Research Rally - Investor's Business Daily",
            "description" => "ServiceNow led the S&P 500, while Microsoft topped the Dow Jones today, but global markets fell hard as the coronavirus outbreak widened.",
            "url" => "https://www.investors.com/market-trend/stock-market-today/dow-jones-today-futures-dive-fed-coronavirus-risk-microsoft-qorvo-lam-research-rally/",
            "urlToImage" => "https://www.investors.com/wp-content/uploads/2017/04/Stock-bullbutt2-adobe.jpg",
            "publishedAt" => "2020-01-30T13:59:00Z",
            "content" => "Stocks took a leg down at Thursday's starting bell, as global markets read increasing economic impact into China's spreading coronavirus outbreak. Chip stocks were mixed but software stocks showed strength, as ServiceNow (NOW) headed the S&amp;P 500 and Micro… [+6680 chars]"
        },
        %{
           "source" => {
                "id" => nil,
                "name" => "Nytimes.com"
            },
            "author" => "Katie Robertson",
            "title" => "Altria Takes a $4.1 Billion Hit on Juul Stake - The New York Times",
            "description" => "Following an earlier write-down of $4.5 billion, the tobacco giant’s stake in the vaping start-up is now worth a fraction of what it paid in 2018.",
            "url" => "https://www.nytimes.com/2020/01/30/business/juul-altria-vaping.html",
            "urlToImage" => "https://static01.nyt.com/images/2020/01/30/world/30altria/30altria-facebookJumbo.jpg",
            "publishedAt" => "2020-01-30T13:36:00Z",
            "content" => "Altria reported a $4.1 billion write-down on its Juul Labs investment on Thursday, another sizable charge as the vaping crisis continues to roil the e-cigarette industry. The company now values its 35 percent stake in the e-cigarette company at $4.2 billion,… [+616 chars]"
          }
        ]
      }
    }
  """

  def search(params, api_key \\ :global) do
    case check(params) do
      {:ok, params} ->
        get(@url_part, api_key, struct(TopHeadlines.Params, params))

      {:error, error} ->
        error
    end
  end
end
