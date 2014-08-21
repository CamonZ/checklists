require 'rails_helper'

describe UserAuthentication::AuthorizeUserFromTokenContext do
  describe "when first authenticating the access token from the mobile client" do
    describe "and the request is with a valid token" do
      it "should get the info of a new user" do
        stub_request(:get, "https://accounts.google.com/o/oauth2/token?access_token=valid_token&verify=true").
          with(:headers => {'Authorization'=>'Token token="valid_token"'}).
          to_return(File.new("#{Rails.root}/spec/fixtures/requests/valid_oauth_verify_profile_response.txt"))
        pending
      end
    end

    describe "and the request is with an invalid token " do
      it "should return an error" do
        stub_request(:get, "https://accounts.google.com/o/oauth2/token?access_token=invalid_token&verify=true").
          with(:headers => {'Authorization'=>'Token token="invalid_token"'}).
          to_return(File.new("#{Rails.root}/spec/fixtures/requests/invalid_oauth_verify_profile_response.txt"))
        pending
      end
    end
  end

  describe "when testing the private methods" do
    before :each do
      @params = Hashie::Mash.new({
        client_id: "valid_client_id",
        client_secret: "client_secret",
        google_token: "valid_token"
      })

      @context = UserAuthentication::AuthorizeUserFromTokenContext.new(@params)
      @client = @context.send(:client)
    end

    describe "when testing #client" do

      it "#client should return an OAuth2 client" do
        expect(@client).to be_an_instance_of(::OAuth2::Client)
      end

      it "should have the client_id sent in the params" do
        expect(@client.id).to eq("valid_client_id")
      end

      it "should have the client_secret sent in the params" do
        expect(@client.secret).to eq("client_secret")
      end

      it "should be configured to work with google's oauth2" do
        expect(@client.site).to eq("https://accounts.google.com")
        expect(@client.options).to include({:authorize_url=>"/o/oauth2/auth", :token_url=>"/o/oauth2/token"})
      end
    end

    describe "when testing #access_token" do
      it "should request the access token from google" do
        expect(@client.auth_code).to receive(:get_token).with(@params.google_token, { :redirect_uri => 'postmessage'}, {})
        @context.send(:access_token)
      end
    end

    describe "when testing #raw_info" do

    end
  end

end