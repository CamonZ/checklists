class Survey < ActiveRecord::Base
  belongs_to :checklist
  has_many :check_item_results, inverse_of: :survey

  validates :checklist, presence: true
  validates :check_item_results, presence: true
end
