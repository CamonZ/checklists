require 'rails_helper'

RSpec.describe Checklist, :type => :model do
  it { should belong_to :user }
  it { should have_many :check_items }
end
