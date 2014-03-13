class AddFacilityManagerName < ActiveRecord::Migration
  def change
    add_column :properties, :property_manager_name, :string
  end
end
