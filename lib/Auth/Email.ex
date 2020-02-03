defmodule Systemdev.Mailer do
    use Bamboo.Mailer, otp_app: :systemdev
    import Bamboo.Email

    def confirm_email(email, code) do

        # new_email(
        #   to: "john@gmail.com",
        #   from: "support@myapp.com",
        #   subject: "Welcome to the app.",
        #   html_body: "<strong>Thanks for joining!</strong>",
        #   text_body: "Thanks for joining!"
        # )
    
        # or pipe using Bamboo.Email functions
        new_email()
        |> to(email)
        |> from("rafwambugu@gmail.com")
        |> subject("Confirm Email!!!")
        |> html_body("<strong>Email Confirmation</strong>")
        |> text_body("Hello, We are test app, please confirm your email by resending this verification code: #{code}")

    end

end