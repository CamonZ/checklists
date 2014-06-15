class Checklist < ActiveRecord::Base
  belongs_to :user
  has_many :check_items
end
