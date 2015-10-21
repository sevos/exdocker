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

  test "containers / return single container" do
    with_mock HTTPotion, [get: fn(_url) ->
                           %HTTPotion.Response{body: docker_containers_response_with(:redis)}
                         end] do

      # TODO: assert a map with few keys
      # assert [{_}] == EXDockerClient.containers(docker_connection)
      assert called HTTPotion.get("http://127.0.0.1:2375/v1.20/containers/json")
    end
  end

  defp docker_containers_response_with(:redis) do
    "[{\"Id\":\"a1023058c9bbd44e679632e72eb345c2ca169b87061c802ea78b0c295de975f5\",\"Names\":[\"/some-redis\"],\"Image\":\"redis\",\"Command\":\"/entrypoint.sh redis-server\",\"Created\":1445469224,\"Ports\":[{\"PrivatePort\":6379,\"Type\":\"tcp\"}],\"Labels\":{},\"Status\":\"Up 40 seconds\",\"HostConfig\":{\"NetworkMode\":\"default\"}}]\n"
  end
end
