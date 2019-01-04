defmodule K8s.Conf.Auth.AuthProviderTest do
  @moduledoc false
  use ExUnit.Case, async: true

  alias K8s.Conf
  alias K8s.Conf.Auth.AuthProvider

  test "first" do
    auth = %{
      "auth-provider" => %{
        config => %{
          "access-token" =>
            "ya29.Gl1GBuiORlyGglqbMv5Wh5onLC9wnWOCd5mCrfDumz4HljaKdS1k4Yyu9S0xKuPX7CaQj2Fz_rPvm3HvBsdSRU797J7bqdLNOsTZVcLP2rN4Is1Hmlp5WBybB3xq24k",
          "cmd-args" => "config config-helper --format=json",
          "cmd-path" => "/Users/roman/google-cloud-sdk/bin/gcloud",
          "expiry" => "2018-10-30T12:03:03.000Z",
          "expiry-key" => "{.credential.token_expiry}",
          "token-key" => "{.credential.access_token}"
        },
        name => "gcp"
      }
    }
    # 1. check if key expirable and is expired
    # 2. if key expired, build and execute command
    # 3. extract key + expiry date
    # 4. profit ? would be nice to save this to the 

    AuthProvider.create(auth, "")
  end
end
