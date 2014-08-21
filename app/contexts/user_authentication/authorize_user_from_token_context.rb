class UserAuthentication::AuthorizeUserFromTokenContext

  def initialize(data)
    data = Hashie::Mash.new(accepted_params_api(data)) if data.class == ActionController::Parameters
    @request_data = data
  end


  def execute
    response = {}
    create_user_context = FindOrCreateUserFromGoogleOauth2Context.new(auth_hash)
    @user = create_user_context.execute
    #create our API token for the user and return that shit.
    response[:token] = create_api_token if(@user.persisted?)
    response
  end


  private

  CLIENT_OPTIONS = {
    :site          => 'https://accounts.google.com',
    :authorize_url => '/o/oauth2/auth',
    :token_url     => '/o/oauth2/token'
  }

  def create_api_token
    nil
  end

  def accepted_params_api(params)
    params.permit(:client_id, :client_secret, :google_token)
  end

  def client
    @client ||= ::OAuth2::Client.new(
      @request_data.client_id,
      @request_data.client_secret,
      CLIENT_OPTIONS)
  end

  def access_token
    client.auth_code.get_token(@request_data.google_token, { :redirect_uri => 'postmessage'}, {})
  end

  def raw_info
    @raw_info ||= access_token.get('https://www.googleapis.com/plus/v1/people/me/openIdConnect').parsed
  end

  def auth_hash
    hash = ::OAuth2::AuthHash.new(:provider => 'google_oauth2', :uid => uid)
    hash.info = info
    hash.credentials = credentials
    hash
  end

  def uid
    raw_info['sub'] || verified_email
  end

  def credentials
    hash = {'token' => access_token.token}
    hash.merge!('refresh_token' => access_token.refresh_token) if access_token.expires? && access_token.refresh_token
    hash.merge!('expires_at' => access_token.expires_at) if access_token.expires?
    hash.merge!('expires' => access_token.expires?)
    hash
  end

  def info
    prune!({
      name:          raw_info['name'],
      email:         verified_email,
      first_name:    raw_info['given_name'],
      last_name:     raw_info['family_name'],
      urls: { 'Google' => raw_info['profile'] }
    })
  end

  def verified_email
    raw_info['email_verified'] ? raw_info['email'] : nil
  end

  def prune!(hash)
    hash.delete_if do |_, v|
      prune!(v) if v.is_a?(Hash)
      v.nil? || (v.respond_to?(:empty?) && v.empty?)
    end
  end
end