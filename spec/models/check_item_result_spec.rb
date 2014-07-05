require 'rails_helper'

RSpec.describe CheckItemResult, :type => :model do
  it { should belong_to :user }
  it { should belong_to :check_item }
  it { should belong_to :survey }

  it { should validate_presence_of :check_item }
  it { should validate_presence_of :survey }
  it { should validate_presence_of :user }

  it_behaves_like "an inspection item"
end
