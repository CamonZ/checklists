require 'rails_helper'

RSpec.describe Survey, :type => :model do
  it {should validate_presence_of :checklist }
  it {should validate_presence_of :check_item_results }
end
