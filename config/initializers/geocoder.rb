require 'uri'
uri     = URI.parse(ENV["REDISTOGO_URL"])
$redis  = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password, :thread_safe => true) rescue nil


if $redis.present?
  # config/initializers/geocoder.rb
  Geocoder.configure(
    :lookup     => :google,
    :ip_lookup  => :maxmind,
    :timeout    => 5,
    :units      => :km,
    :cache      => $redis,
    :cache_prefix => "homeforgrandma"
  )
else
  # config/initializers/geocoder.rb
  Geocoder.configure(
    :lookup     => :google,
    :ip_lookup  => :maxmind,
    :timeout    => 5,
    :units      => :km
  )
end