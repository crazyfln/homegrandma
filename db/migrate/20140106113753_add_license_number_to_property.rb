class AddLicenseNumberToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :license_number, :string
  end

  def self.down
    remove_column :properties, :license_number
  end
end
