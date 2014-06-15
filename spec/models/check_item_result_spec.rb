require 'rails_helper'

RSpec.describe CheckItemResult, :type => :model do
  it { should belong_to :user }
  it { should belong_to :check_item }
end
