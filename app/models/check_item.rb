class CheckItem < ActiveRecord::Base
  belongs_to :checklist
  belongs_to :user

  has_many :check_item_results, inverse_of: :check_item
  has_many :measurements

  validates_presence_of :checklist
  validates_presence_of :user

  before_validation(on: :create) do
    self.user_id = checklist.user_id unless checklist.blank?
  end
end
