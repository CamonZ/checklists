require 'rails_helper'

RSpec.describe CheckItem, :type => :model do
  it { should belong_to :checklist }
  it { should belong_to :user }
  it { should have_many :check_item_results }

  it { should validate_presence_of :checklist }
  it { should validate_presence_of :user }

  describe "when creating a check_item" do
    let(:check_item) { FactoryGirl.build(:check_item) }
    let(:user_id ) { check_item.user_id }

    before do
      check_item.user_id = nil
    end

    it "should set the user id from the checklist the check_item belongs to" do
      check_item.save!
      expect(check_item.user_id).to eq(user_id)
    end
  end
end
