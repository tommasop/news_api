defmodule Sources.Params do
  defstruct [:country, :category, :language]

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

  @type language ::
          :ar | :de | :en | :es | :fr | :he | :it | :nl | :no | :pt | :ru | :se | :ud | :zh

  @type t :: %__MODULE__{
          country: country,
          category: category,
          language: language
        }
end
