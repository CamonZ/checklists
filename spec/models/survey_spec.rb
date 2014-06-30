require 'rails_helper'

RSpec.describe Survey, :type => :model do
  it {should belong_to :user }
  it {should belong_to :checklist }
  it {should validate_presence_of :checklist }
  it {should validate_presence_of :check_item_results }
end
