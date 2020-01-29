defmodule NewsApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :news_api,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Elixir Client for News Api",
      source_url: github_link(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:jason, "~> 1.1"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package() do
    [
      # Optional if we want to keep OTP app name
      name: "news_api_ex",
      maintainers: ["Tommaso Patrizi"],
      licenses: ["MIT"],
      links: %{"GitHub" => github_link()}
    ]
  end

  defp github_link() do
    "https://github.com/tommasop/news_api"
  end
end
