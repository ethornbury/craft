class AddDefaultToColumn < ActiveRecord::Migration
  def self.down
    remove_column    :workphases, :totalMade
  end
end
