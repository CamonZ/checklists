class CreateCheckItems < ActiveRecord::Migration
  def change
    create_table :check_items do |t|
      t.references :checklist
      t.timestamps
    end
  end
end
