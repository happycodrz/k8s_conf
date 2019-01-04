defmodule K8s.Conf.Auth.AuthProvider do
  @moduledoc """
  - https://github.com/kubernetes-client/javascript/pull/158/files
  auth-provider:
      config:
        access-token: ya29.Gl1FBmlTosKTDkHscstEayX_wpjH6rZpNyjJb2wuxVX1JGv-JUftgVQHgRGE43DUusPiNd79ZCRn-YKAJHJkSdT3Mp1wy_Fvc41JYXxMHJrKYlcLCJY9q3ZijvtfQZ4
        cmd-args: config config-helper --format=json
        cmd-path: /Users/user/google-cloud-sdk/bin/gcloud
        expiry: 2018-10-29 21:06:53
        expiry-key: '{.credential.token_expiry}'
        token-key: '{.credential.access_token}'
      name: gcp
  """

  @behaviour K8s.Conf.Auth
  defstruct [:token]
  @type t :: %__MODULE__{token: binary}

  @impl true
  @spec create(map() | any, String.t() | any) :: K8s.Conf.Auth.Exec.t() | nil
  def create(
        %{
          "auth-provider" => %{
            "config" => config,
            "name" => name
          }
        },
        _
      ) do
    1
  end

  @impl true
  def create(_, _), do: nil

  defimpl Inspect, for: __MODULE__ do
    import Inspect.Algebra

    def inspect(_auth, _opts) do
      concat(["#AuthProvider<...>"])
    end
  end

  defimpl K8s.Conf.RequestOptions, for: __MODULE__ do
    @doc "Generates HTTP Authorization options for certificate authentication"
    def generate(%K8s.Conf.Auth.Token{token: token}) do
      %K8s.Conf.RequestOptions{
        headers: [{"Authorization", "Bearer #{token}"}],
        ssl_options: []
      }
    end
  end

  defp is_auth_provider?(name) do
    name in ["azure", "gcp"]
  end

  # defp get_token(config = %{
  #   "access-token" => access_token

  # })

  # end
end
