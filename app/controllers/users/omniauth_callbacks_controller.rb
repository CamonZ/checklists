class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    ctx = UserAuthentication::FindOrCreateUserFromGoogleOauth2Context.new(request.env['omniauth.auth'])

    @user = ctx.execute

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      session["devise.google_data"] = ctx.auth_data
      redirect_to new_user_registration_url
    end
  end
end