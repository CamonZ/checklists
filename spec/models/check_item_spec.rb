require 'rails_helper'

RSpec.describe CheckItem, :type => :model do
  it { should belong_to :checklist }
  it { should belong_to :user }
  it { should have_many :check_item_results }
end
