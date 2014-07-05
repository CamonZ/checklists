require 'rails_helper'

RSpec.describe Checklist, :type => :model do
  it { should belong_to :user }
  it { should have_many :check_items }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :user }
  it {should accept_nested_attributes_for :check_items }
end
