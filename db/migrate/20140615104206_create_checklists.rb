class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      
      t.timestamps
    end
  end
end
