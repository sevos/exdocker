defmodule EXDockerTest do
  use ExUnit.Case

  # test "Communicates with docker" do
  #   host = "https://192.168.59.151:2376"
  #   certs_dir = "/Users/sevos/.docker/machine/machines/dev"
  #   response = HTTPotion.get "#{host}/v1.20/containers/json", [
  #     ibrowse: [
  #       ssl_options: [
  #         cacertfile: "#{certs_dir}/ca.pem",
  #         certfile: "#{certs_dir}/cert.pem",
  #         keyfile: "#{certs_dir}/key.pem"
  #       ]
  #     ]
  #   ]
  #
  #   assert HTTPotion.Response.success?(response)
  # end
end
