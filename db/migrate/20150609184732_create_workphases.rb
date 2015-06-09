class CreateWorkphases < ActiveRecord::Migration
  def change
    create_table :workphases do |t|
      t.string :worknote
      t.integer :total, null: false
      t.datetime :dateChanged
      t.references :product, index: true
      t.references :phase, index: true
      t.references :employee, index: true

      t.timestamps null: false
    end
    add_foreign_key :workphases, :products
    add_foreign_key :workphases, :phases
    add_foreign_key :workphases, :employees
  end
end
