class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :productname,  null: false
      t.string :desc,   null: false

      t.timestamps null: false
    end
  end
end
