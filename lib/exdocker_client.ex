defmodule EXDockerClient do
  def containers(connection) do
    url = connection[:url] <> "/v1.20/containers/json"
    {:ok, result} = JSX.decode HTTPotion.get(url).body
    result
  end

  defp connection_details(%{url: url, tls_verify: true,
                            tls_cert_dir: tls_cert_dir}) do
    %{url: url, tls_verify: tls_verify,
      tls_cacertfile: "#{tls_cert_dir}/ca.pem",
      tls_cert_file: "#{tls_cert_dir}/cert.pem",
      tls_key_file: "#{tls_cert_dir}/key.pem"}
  end

  defp connection_details(%{url: url}) do
    %{url: url, tls_verify: false}
  end

end
