class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :phasename, null: false
      t.string :note, null: false

      t.timestamps null: false
    end
  end
end
