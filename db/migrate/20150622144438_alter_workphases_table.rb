class AlterWorkphasesTable < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :workphases do |t|
        dir.up   { t.change :totalMade, :integer, :default => 0 }
        dir.down { t.change :totalMade }
      end
    end
  end
end
