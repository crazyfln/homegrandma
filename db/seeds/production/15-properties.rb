module SeedProperty
  def self.seed
    Property.destroy_all

    User.all.each do |user|
      FactoryGirl.create_list(:property_complete, 1, user: user)
    end
    puts "Seed data for properties - Done!"
  end
end
