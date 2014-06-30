class CheckItemResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :check_item
  belongs_to :survey

  validates_presence_of :survey
  validates_presence_of :check_item

  before_save(on: :create) do
    self.user_id = survey.user_id
  end
end
