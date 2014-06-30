class CheckItem < ActiveRecord::Base
  belongs_to :checklist
  belongs_to :user

  has_many :check_item_results, inverse_of: :check_item
  has_many :measurements

  before_save(on: :create) do
    self.user_id = checklist.user_id
  end
end
