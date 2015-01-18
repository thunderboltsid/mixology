class CallbacksController < Devise::OmniauthCallbacksController
    def all
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end

    alias_method :facebook, :all
    alias_method :twitter, :all
end