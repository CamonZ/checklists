class CreateCheckItemResults < ActiveRecord::Migration
  def change
    create_table :check_item_results do |t|
      t.decimal    :value, precision: 10, scale: 3
      t.references :user
      t.references :check_item
      t.timestamps
    end
    add_index(:check_item_results, [:user_id, :check_item_id], name: "check_item_result_by_user_id_and_check_item_id_index")
  end
end
