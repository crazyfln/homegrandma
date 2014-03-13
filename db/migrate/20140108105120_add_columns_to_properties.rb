class AddColumnsToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :care_services, :string
    add_column :properties, :feature_and_amenities, :string
    add_column :properties, :dinnings, :string
    add_column :properties, :buy_in_fee, :string
    add_column :properties, :add_person_fee, :string
    add_column :properties, :community_fee, :string
    add_column :properties, :respite_fee, :string
  end

  def self.down
    remove_column :properties, :care_services
    remove_column :properties, :feature_and_amenities
    remove_column :properties, :dinnings
    remove_column :properties, :buy_in_fee
    remove_column :properties, :add_person_fee
    remove_column :properties, :community_fee
    remove_column :properties, :respite_fee
  end
end
