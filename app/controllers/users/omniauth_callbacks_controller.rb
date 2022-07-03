class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # See https://github.com/omniauth/omniauth/wiki/FAQ#rails-session-is-clobbered-after-callback-on-developer-strategy
  skip_before_action :verify_authenticity_token, only: :github

  def github
    auth_hash = request.env["omniauth.auth"]
    @user = User.from_omniauth(auth_hash)
    session[:github_token] = auth_hash.credentials.token

    sign_in_and_redirect @user, event: :authentication
    flash[:success] = "Signed in successfully" if is_navigational_format?
  end

  def failure
    flash[:warning] = "Could not sign you in"
    redirect_to root_path
  end
end
