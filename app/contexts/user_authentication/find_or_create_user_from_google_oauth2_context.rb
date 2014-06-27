class UserAuthentication::FindOrCreateUserFromGoogleOauth2Context
  attr_reader :auth_data

  def initialize(data)
    data = Hashie::Mash.new(accepted_params_api(data)) if data.class == ActionController::Parameters
    @auth_data = data
  end

  def execute
    User.where(@auth_data.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth_data.provider
      user.uid = auth_data.uid
      user.email = auth_data.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth_data.info.name
      user.image_url = auth_data.info.image
    end
  end

  private

  def accepted_params_api(params)
    params.permit(:uid, :provider, credentials: [:token], info: [:email, :name, :image, :first_name, :last_name])
  end
end