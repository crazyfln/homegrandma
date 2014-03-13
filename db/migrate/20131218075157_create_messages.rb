class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references       :property
      t.string           :name
      t.string           :email
      t.date             :estimated_date
      t.text             :body
      t.boolean          :claim_reward
      t.timestamps
    end
  end
end
