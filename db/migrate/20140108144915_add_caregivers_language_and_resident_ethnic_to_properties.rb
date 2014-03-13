class AddCaregiversLanguageAndResidentEthnicToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :caregivers_languages_1, :string
    add_column :properties, :caregivers_languages_2, :string
    add_column :properties, :resident_ethnics_1, :string
    add_column :properties, :resident_ethnics_2, :string
  end

  def self.down
    remove_column :properties, :caregivers_languages_1
    remove_column :properties, :caregivers_languages_2
    remove_column :properties, :resident_ethnics_1
    remove_column :properties, :resident_ethnics_2
  end
end
