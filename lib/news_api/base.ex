defmodule NewsApi.Base do
  @moduledoc """
  Provides general request making and handling functionality (for internal use).
  """
  @base_url "https://newsapi.org/v2"
  @headers [{"User-Agent", "NewsApiElixirClient"}, {"Content-Type", "application/json"}]

  @doc """
  General HTTP `GET` request function. Takes a url part
  and optionally a api_key and list of params.
  """
  def get(url_part, api_key, params \\ []) do
    request_and_retry(url_part, api_key, params, {:attempt, 1})
  end

  def request_and_retry(_url_part, _api_key, _params, {:error, reason}), do: {:error, reason}

  def request_and_retry(url_part, api_key, params, {:attempt, attempt}) do
    [url_part, params]
    |> build_url
    |> HTTPoison.get!(add_auth_header(api_key))
    |> handle_response
    |> case do
      {:retry, reason} ->
        request_and_retry(url_part, api_key, params, attempt_again?(attempt, reason))

      res ->
        res
    end
  end

  defp handle_response(%HTTPoison.Response{status_code: 200, body: body}),
    do: {:ok, Jason.decode!(body)}

  defp handle_response(%HTTPoison.Response{status_code: 429, body: body}),
    do: {:retry, Jason.decode!(body)}

  defp handle_response(%HTTPoison.Response{status_code: status, body: body}) do
    res = %{body: body |> Jason.decode!(), status: status}
    {:error, res}
  end

  defp build_url([part]) do
    (@base_url <> part)
    |> set_trailing_slash
  end

  defp build_url([part, []]) do
    (@base_url <> part)
    |> set_trailing_slash
  end

  defp build_url([part, params]) do
    params =
      Map.from_struct(params)
      |> Enum.reject(fn param -> is_nil(elem(param, 1)) end)

    "#{@base_url}#{part}?#{URI.encode_query(params)}"
  end

  defp set_trailing_slash(string) do
    string
    |> String.ends_with?("/")
    |> case do
      true -> string
      false -> string <> "/"
    end
  end

  def attempt_again?(attempt, reason) do
    if attempt >= 15 do
      {:error, reason}
    else
      attempt |> backoff
      {:attempt, attempt + 1}
    end
  end

  def backoff(attempt) do
    (:math.pow(4, attempt) + 15 + :rand.uniform(30) * attempt * 1_000)
    |> trunc
    |> :timer.sleep()
  end

  defp add_auth_header(:global) do
    api_key = System.get_env("NEWS_API_KEY")
    @headers ++ [{'Authorization', api_key}]
  end

  defp add_auth_header(api_key) do
    @headers ++ [{'Authorization', api_key}]
  end
end
