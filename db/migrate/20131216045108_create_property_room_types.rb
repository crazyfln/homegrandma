class CreatePropertyRoomTypes < ActiveRecord::Migration
  def change
    create_table :property_room_types do |t|
      t.references  :property
      t.string      :name
      t.decimal     :price_start_at, :precision => 12, :scale => 2
      t.timestamps
    end
  end
end
