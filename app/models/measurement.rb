class Measurement < ActiveRecord::Base
  belongs_to :check_item
  belongs_to :user
end
