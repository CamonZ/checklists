class CheckItemResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :check_item
end
