class Survey < ActiveRecord::Base
  belongs_to :checklist
  belongs_to :user
  has_many :check_item_results, inverse_of: :survey

  validates :checklist, presence: true
  validates :check_item_results, presence: true

  accepts_nested_attributes_for :check_item_results
end
