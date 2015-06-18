class AddColumnsToWorkphases < ActiveRecord::Migration
  def change
    add_column    :workphases, :totalMade, :integer,  null: false, default: 0
    add_column    :workphases, :dateComplete, :date
    add_column    :workphases, :adminNote, :string
    rename_column :workphases, :total, :totalToMake
  end
end
