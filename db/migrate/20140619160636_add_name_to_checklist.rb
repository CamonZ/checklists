class AddNameToChecklist < ActiveRecord::Migration
  def change
    add_column :checklists, :name, :string
  end
end
