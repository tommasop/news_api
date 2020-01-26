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
    :pageSize,
    :page
  ]

  @type t :: %__MODULE__{
          q: String.t(),
          qInTitle: String.t(),
          sources: String.t(),
          domains: String.t(),
          excludeDomains: String.t(),
          from: String.t(),
          to: String.t(),
          language: String.t(),
          pageSize: integer,
          page: integer
        }
end
