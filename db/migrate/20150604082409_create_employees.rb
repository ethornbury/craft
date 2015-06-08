class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.belongs_to :user, index: true
      t.string :firstname
      t.string :lastname
      t.string :add1
      t.string :add2
      t.string :add3
      t.string :role
      t.string :status
      t.boolean :admin,       default: false
      #t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :employees, :users
  end
end
