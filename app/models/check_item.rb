class CheckItem < ActiveRecord::Base
  belongs_to :checklist
  belongs_to :user

  has_many :check_item_results
end
