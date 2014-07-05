require 'rails_helper'

RSpec.shared_examples "an inspection item" do
    let(:instance) { FactoryGirl.build(described_class.name.underscore.to_sym) }
    let(:user_id ) { instance.user_id }

    before do
      instance.user_id = nil
    end

    it "should set the user id from the parent the instance belongs to" do
      instance.save!
      expect(instance.user_id).to eq(user_id)
    end
end