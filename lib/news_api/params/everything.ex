defmodule Everything.Params do
  defstruct [
    :q,
    :qInTitle,
    :sources,
    :domains,
    :excludeDomains,
    :from,
    :to,
    :language,
    :sortBy,
    :pageSize,
    :page
  ]

  @type language ::
          :ar | :de | :en | :es | :fr | :he | :it | :nl | :no | :pt | :ru | :se | :ud | :zh

  @type sort_by :: :relevancy | :popularity | :publishedAt

  @type t :: %__MODULE__{
          q: String.t(),
          qInTitle: String.t(),
          sources: String.t(),
          domains: String.t(),
          excludeDomains: String.t(),
          from: String.t(),
          to: String.t(),
          language: language,
          sortBy: sort_by,
          pageSize: integer,
          page: integer
        }

  def check(params) do
    case params do
      %{from: from, to: to} ->
        case Date.from_iso8601(from) do
          {:ok, _} ->
            case Date.from_iso8601(to) do
              {:ok, _} -> {:ok, params}
              {:error, _} -> {:error, "Wrong date format!"}
            end

          {:error, _} ->
            {:error, "Wrong date format!"}
        end

      %{from: from} ->
        case Date.from_iso8601(from) do
          {:ok, _} -> {:ok, params}
          {:error, _} -> {:error, "Wrong date format!"}
        end

      %{to: to} ->
        case Date.from_iso8601(to) do
          {:ok, _} -> {:ok, params}
          {:error, _} -> {:error, "Wrong date format!"}
        end
    end
  end
end
