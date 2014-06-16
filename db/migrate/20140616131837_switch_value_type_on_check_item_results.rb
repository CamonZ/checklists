class SwitchValueTypeOnCheckItemResults < ActiveRecord::Migration
  def change
    change_column(:check_item_results, :value, :integer, default: 0)
  end
end
