class AddCapacityToProprties < ActiveRecord::Migration
  def self.up
    add_column :properties, :capacity, :integer
  end

  def self.down
    remove_column :properties, :capacity
  end
end
