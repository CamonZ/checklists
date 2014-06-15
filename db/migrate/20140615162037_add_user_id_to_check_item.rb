class AddUserIdToCheckItem < ActiveRecord::Migration
  def change
    add_column(:check_items, :user_id, :integer)
    add_index(:check_items, [:user_id, :checklist_id], name: "check_items_by_user_id_and_checklist_id_index")
  end
end
