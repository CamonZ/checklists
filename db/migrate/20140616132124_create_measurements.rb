class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.decimal    :value
      t.references :user
      t.references :check_item
      t.timestamps
    end
  end
end
