class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.references    :user
      t.string        :name
      t.string        :address
      t.string        :state_code
      t.string        :zip
      t.string        :city
      t.string        :phone_number
      t.string        :phone_number_2
      t.text          :types
      t.text          :description

      # for location
      # ---------------------------------
      t.float         :latitude
      t.float         :longitude

      t.timestamps
    end
  end
end
