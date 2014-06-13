require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get 'show'
      expect(response).to be_success
    end
  end

end
