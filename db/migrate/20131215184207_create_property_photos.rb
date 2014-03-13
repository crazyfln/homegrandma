class CreatePropertyPhotos < ActiveRecord::Migration
  def change
    create_table :property_photos do |t|
      t.references  :property
      t.string      :photo
      t.boolean     :primary, default: false
      t.timestamps
    end
  end
end
