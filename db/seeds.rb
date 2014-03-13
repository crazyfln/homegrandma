# This method reads database.yml configuration and convert it to hash object
def load_config
  YAML.load_file(File.join(Rails.root, 'config', 'database.yml'))[Rails.env]
end

def load_rb(seed)
  puts "executing file #{seed.inspect}"
  require "#{seed}"
  klass_name = ("seed_" + File.basename("#{seed}", '.rb').split('-').last).classify
  klass = klass_name.constantize
  klass.send(:seed)
end

def load_yml(seed)
  puts "seeding file #{seed.inspect}"
  documents = YAML.load_file(seed)
  klass_name = File.basename(seed, '.yml').split('-').last.classify
  klass = klass_name.constantize
  klass.destroy_all
  klass.connection.execute("ALTER TABLE #{klass_name.underscore.pluralize} AUTO_INCREMENT = 1")
  documents.sort.each do |doc|
    puts doc.inspect
    new_record = klass.new
    doc.last.each do |attr, value|
      new_record.send("#{attr}=", value)
    end
    puts new_record.inspect
    if klass.to_s == 'User'
      user = new_record
      user.register!
      user.activate!
      user.is_system_admin = doc.last['is_system_admin']
    else
      new_record.save(false)
    end
    puts "Error : #{new_record.errors.full_messages}" unless
    new_record.errors.full_messages.empty?
  end
end

# This method insert data to database from sql file
def load_sql(seed)
  begin
    puts "seeding file #{seed.inspect}"
    klass_name = File.basename(seed, '.sql').split('-').last.classify
    klass = klass_name.constantize
    klass.connection.execute("TRUNCATE #{klass_name.underscore.pluralize}")
    klass.connection.execute(File.read(Rails.root.join('db', 'seeds', Rails.env, seed)))
  rescue
    puts "error injecting sql"
  end
end

if ENV["VERSION"]
  Dir[Rails.root.join('db', 'seeds', Rails.env, '*')].sort.each do |seed|
    next unless File.basename(seed).split('-').first.to_f == ENV["VERSION"].to_f
    if File.extname(seed) == '.yml'
      load_yml(seed)
    elsif File.extname(seed) == '.sql'
      load_sql(seed)
    elsif File.extname(seed) == '.rb'
      load_rb(seed)
    end
  end
else
  # database_config = load_config
  Dir[Rails.root.join('db', 'seeds', Rails.env, '*')].sort.each do |seed|
    if File.extname(seed) == '.yml'
      # load_yml(seed)
    elsif File.extname(seed) == '.sql'
      # database_config = load_config
      load_sql(seed)
    elsif File.extname(seed) == '.rb'
      load_rb(seed)
    end
  end
end
