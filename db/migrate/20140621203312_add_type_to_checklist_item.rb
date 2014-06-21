class AddTypeToChecklistItem < ActiveRecord::Migration
  def change
    add_column(:check_items, :type, :string)
  end
end
