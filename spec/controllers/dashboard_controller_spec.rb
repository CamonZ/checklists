require 'rails_helper'

RSpec.describe DashboardController, :type => :controller do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      expect(response).to be_success
    end
  end

end
