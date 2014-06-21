class Checklist < ActiveRecord::Base
  belongs_to :user
  has_many :check_items

  accepts_nested_attributes_for :check_items
  
  scope :for_user, ->(user_id) { where(:user_id => user_id) }
end
