defmodule K8s.Conf.Auth.Dummy do
  @moduledoc """
  Token based cluster authentication
  """

  @behaviour K8s.Conf.Auth
  defstruct [:payload]
  @type t :: %__MODULE__{payload: binary}

  @impl true
  @spec create(map() | any, String.t() | any) :: K8s.Conf.Auth.Token.t() | nil
  def create(payload, _), do: %K8s.Conf.Auth.Dummy{payload: payload}

  # @impl true
  # def create(_, _), do: nil

  # defimpl Inspect, for: __MODULE__ do
  #   import Inspect.Algebra

  #   def inspect(_auth, _opts) do
  #     concat(["#Token<...>"])
  #   end
  # end

  defimpl K8s.Conf.RequestOptions, for: __MODULE__ do
    @doc "Generates HTTP Authorization options for certificate authentication"
    def generate(%K8s.Conf.Auth.Token{token: token}) do
      %K8s.Conf.RequestOptions{
        headers: [{"Authorization", "Bearer #{token}"}],
        ssl_options: []
      }
    end
  end
end
