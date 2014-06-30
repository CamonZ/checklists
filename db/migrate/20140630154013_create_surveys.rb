class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.references :checklist
      t.timestamps
    end
  end
end
