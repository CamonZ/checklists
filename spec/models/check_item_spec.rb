require 'rails_helper'

RSpec.describe CheckItem, :type => :model do
  it { should belong_to :checklist }
  it { should belong_to :user }
  it { should have_many :check_item_results }

  it { should validate_presence_of :checklist }
  it { should validate_presence_of :user }
  it_behaves_like "an inspection item"
end
