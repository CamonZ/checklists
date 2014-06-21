class AddQuestionFieldToCheckItems < ActiveRecord::Migration
  def change
    add_column(:check_items, :question, :string)
  end
end
