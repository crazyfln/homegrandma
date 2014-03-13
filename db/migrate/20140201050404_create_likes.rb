class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :property
      t.references :user
      t.timestamps
    end
  end
end
