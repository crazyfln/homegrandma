# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

require 'simplecov'
SimpleCov.start 'rails'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'database_cleaner'


# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start

    # Fill data for States
    # ------------------------------
    [
      {:code => 'AL', :name => 'Alabama'},
      {:code => 'AK', :name => 'Alaska'},
      {:code => 'AZ', :name => 'Arizona'},
      {:code => 'AR', :name => 'Arkansas'},
      {:code => 'CA', :name => 'California'},
      {:code => 'CO', :name => 'Colorado'},
      {:code => 'CT', :name => 'Connecticut'},
      {:code => 'DE', :name => 'Delaware'},
      {:code => 'DC', :name => 'District of Columbia'},
      {:code => 'FL', :name => 'Florida'},
      {:code => 'GA', :name => 'Georgia'},
      {:code => 'HI', :name => 'Hawaii'},
      {:code => 'ID', :name => 'Idaho'},
      {:code => 'IL', :name => 'Illinois'},
      {:code => 'IN', :name => 'Indiana'},
      {:code => 'IA', :name => 'Iowa'},
      {:code => 'KS', :name => 'Kansas'},
      {:code => 'KY', :name => 'Kentucky'},
      {:code => 'LA', :name => 'Louisiana'},
      {:code => 'ME', :name => 'Maine'},
      {:code => 'MT', :name => 'Montana'},
      {:code => 'NE', :name => 'Nebraska'},
      {:code => 'NV', :name => 'Nevada'},
      {:code => 'NH', :name => 'New Hampshire'},
      {:code => 'NJ', :name => 'New Jersey'},
      {:code => 'NM', :name => 'New Mexico'},
      {:code => 'NY', :name => 'New York'},
      {:code => 'NC', :name => 'North California'},
      {:code => 'ND', :name => 'North Dakota'},
      {:code => 'OH', :name => 'Ohio'},
      {:code => 'OK', :name => 'Oklahoma'},
      {:code => 'OR', :name => 'Oregon'},
      {:code => 'MD', :name => 'Maryland'},
      {:code => 'MA', :name => 'Massachusetts'},
      {:code => 'MI', :name => 'Michigan'},
      {:code => 'MN', :name => 'Minnesota'},
      {:code => 'MS', :name => 'Mississippi'},
      {:code => 'MO', :name => 'Missouri'},
      {:code => 'PA', :name => 'Pennsylvania'},
      {:code => 'RI', :name => 'Rhode Island'},
      {:code => 'SC', :name => 'South Carolina'},
      {:code => 'SD', :name => 'South Dakota'},
      {:code => 'TN', :name => 'Tennessee'},
      {:code => 'TX', :name => 'Texas'},
      {:code => 'UT', :name => 'Utah'},
      {:code => 'VT', :name => 'Vermont'},
      {:code => 'VA', :name => 'Virginia'},
      {:code => 'WA', :name => 'Washington'},
      {:code => 'WV', :name => 'West Virginia'},
      {:code => 'WI', :name => 'Wisconsin'},
      {:code => 'WY', :name => 'Wyoming'}
    ].each do |item|
      State.create(:code => item[:code], :name => item[:name])
    end
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # include some helpers
  config.include FactoryGirl::Syntax::Methods

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end
