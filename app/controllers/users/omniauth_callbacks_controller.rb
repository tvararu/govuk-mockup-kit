class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # See https://github.com/omniauth/omniauth/wiki/FAQ#rails-session-is-clobbered-after-callback-on-developer-strategy
  skip_before_action :verify_authenticity_token, only: :github

  def github
    auth_hash = request.env["omniauth.auth"]
    @user = User.from_omniauth(auth_hash)

    session[:github_token] = auth_hash.credentials.token

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      if is_navigational_format?
        set_flash_message(:notice, :success, kind: "GitHub")
      end
    else
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
