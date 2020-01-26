defmodule TopHeadlines.Params do
  defstruct [:q, :country, :category, :sources, :pageSize, :page]

  @type country ::
          :ae
          | :ar
          | :at
          | :au
          | :be
          | :bg
          | :br
          | :ca
          | :ch
          | :cn
          | :co
          | :cu
          | :cz
          | :de
          | :eg
          | :fr
          | :gb
          | :gr
          | :hk
          | :hu
          | :id
          | :ie
          | :il
          | :in
          | :it
          | :jp
          | :kr
          | :lt
          | :lv
          | :ma
          | :mx
          | :my
          | :ng
          | :nl
          | :no
          | :nz
          | :ph
          | :pl
          | :pt
          | :ro
          | :rs
          | :ru
          | :sa
          | :se
          | :sg
          | :si
          | :sk
          | :th
          | :tr
          | :tw
          | :ua
          | :us
          | :ve
          | :za

  @type category ::
          :business | :entertainment | :general | :health | :science | :sports | :technology

  @type t :: %__MODULE__{
          q: String.t(),
          country: country,
          category: category,
          sources: String.t(),
          pageSize: integer,
          page: integer
        }

  def check(params) do
    case params do
      %{country: _, sources: _} ->
        {:error, "No country and sources together are allowed!"}

      %{category: _, sources: _} ->
        {:error, "No country and sources together are allowed!"}
    end
  end
end
