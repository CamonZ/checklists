class AddDescriptionToChecklist < ActiveRecord::Migration
  def change
    add_column(:checklists, :description, :text)
  end
end
