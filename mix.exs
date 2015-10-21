defmodule EXDocker.Mixfile do
  use Mix.Project

  def project do
    [app: :exdocker,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: [
       contributors: ["Artur Roszczyk"],
       licenses: ["MIT"],
       links: %{github: "https://github.com/sevos/exdocker"},
       files: ~w(lib mix.exs README.md)
     ],
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :httpotion]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
        {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.2"},
        {:httpotion, "~> 2.1.0"},
        {:exjsx, "~> 3.1.0"},
        {:mock, "~> 0.1.1"}
    ]
  end
end
