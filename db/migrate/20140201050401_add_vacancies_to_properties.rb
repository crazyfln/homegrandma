class AddVacanciesToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :vacancies, :string
  end
end
