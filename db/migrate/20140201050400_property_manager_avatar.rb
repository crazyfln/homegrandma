class PropertyManagerAvatar < ActiveRecord::Migration
  def change
    add_column :properties, :property_manager_avatar, :string
  end
end
