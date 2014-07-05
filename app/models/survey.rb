class Survey < ActiveRecord::Base
  belongs_to :checklist
  belongs_to :user
  has_many :check_item_results, inverse_of: :survey

  validates_presence_of :checklist
  validates_presence_of :user

  accepts_nested_attributes_for :check_item_results
end
