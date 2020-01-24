defmodule Systemdev.Guardian.AuthPipeline do
    use Guardian.Plug.Pipeline, otp_app: :systemdev,

    module: Systemdev.Guardian,
    error_handler: Systemdev.AuthErrorHandler

    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.EnsureAuthenticated
    plug Guardian.Plug.LoadResource

end
