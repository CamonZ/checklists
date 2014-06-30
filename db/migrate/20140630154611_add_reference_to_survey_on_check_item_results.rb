class AddReferenceToSurveyOnCheckItemResults < ActiveRecord::Migration
  def change
    add_column(:check_item_results, :survey_id, :integer)
  end
end
