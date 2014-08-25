require 'rails_helper'

describe UserAuthentication::AuthorizeUserFromTokenContext do
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