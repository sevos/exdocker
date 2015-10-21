defmodule EXDockerClientTest do
  use ExUnit.Case
  import Mock

  def docker_connection do
    [url: "http://127.0.0.1:2375"]
  end

  test "containers / return empty list" do
    with_mock HTTPotion, [get: fn(_url) ->
                           %HTTPotion.Response{body: "[]\n"}
                         end] do

      assert EXDockerClient.containers(docker_connection) == []
      assert called HTTPotion.get("http://127.0.0.1:2375/v1.20/containers/json")
    end
  end
end
