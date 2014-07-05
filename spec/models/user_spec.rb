require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many :checklists }
  it { should have_many :check_items }
  it { should have_many :check_item_results }
  it { should have_many :surveys }
end
