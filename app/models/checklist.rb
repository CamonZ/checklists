class Checklist < ActiveRecord::Base
  belongs_to :user
  has_many :check_items

  accepts_nested_attributes_for :check_items

  scope :for_user, ->(user) { where(:user_id => user.id) }

  validates_presence_of :name, :description
  validates_presence_of :user
end
