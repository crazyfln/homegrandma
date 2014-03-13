module SeedUser
  def self.seed
    User.destroy_all
    10.times do |i|
      FactoryGirl.create(:user, :email => "user_#{i+1}@example.com", :password => '12345678')
    end
    puts "Seed data for users - Done !"
  end
end
