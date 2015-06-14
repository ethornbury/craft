class ChangeColumnsTypeWorkphases < ActiveRecord::Migration
  def change
    change_column :workphases, :dateComplete, :datetime
  end
end
