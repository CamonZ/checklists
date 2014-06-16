require 'rails_helper'

RSpec.describe Measurement, :type => :model do
  it { should belong_to :check_item }
  it { should belong_to :user }
end
