defmodule Systemdev.Sms do
    
    def send_sms() do
        token = "MjU6Ojo6NTk6Ojo6Mjo6OjpWMnp1Q1E4MExySHN4cTc3NkF3YTBVSm9kdWJGVGtqYXRSVEl0Q2g3Rk1Ga1h5RjRtXzBsblQ1MDRmRll3a2Jq"
        url = "https://vas.wasiliana.co.ke/api/message/send/sms"
        body = %{message: "Success Message", msisdn: "0710883976", sender_id: "Systemdev"}
        headers = ["X-TOKEN": token, "Accept": "Application/json; Charset=utf-8"]
        case HTTPoison.post(url, Poison.encode!(body), headers) do
            {:ok, response} ->
                response
            {:error, error} ->
                error
        end
    end

end