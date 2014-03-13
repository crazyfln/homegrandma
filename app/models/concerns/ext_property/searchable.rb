module ExtProperty::Searchable
  extend ActiveSupport::Concern

  included do
    include Tire::Model::Search
    include Tire::Model::Callbacks

    mapping do
      indexes :id,                                       :type =>'integer', :index    => :not_analyzed
      indexes :name_and_full_address,                    :type => 'string', :analyzer => 'snowball', :boost => 100, :as => "name_and_full_address"
      indexes :caregivers_languages_2,                   :type => 'string', :analyzer => 'snowball', :boost => 100
      indexes :resident_ethnic,                          :type => 'string', :analyzer => 'snowball', :boost => 100, :as => "resident_ethnic"

      # type array
      indexes :types,                                    :analyzer => 'keyword'
      indexes :care_services,                            :analyzer => 'keyword'
      indexes :feature_and_amenities,                    :analyzer => 'keyword'

      # type boolean
      indexes :accept_ssi,                               :type => 'boolean'
    end
  end

  # NOTE The ordering of latitude and longitude for indexing geo points is different
  # based on whether a string or an array is used. The order when using an array
  # should be [longitude, latitude] versus for a string where it should be "latitude,longitude".
  # See The elasticsearch documentation for more information.
  # http://www.elasticsearch.org/guide/reference/mapping/geo-point-type.html
  def lat_lon
    [latitude, longitude].join(',')
  end

  # Merge address, city, state code in one line
  #
  def full_address
    [address, city, state_code, zip].compact.uniq.join ' '
  end

  # return name + ful_address
  #
  def name_and_full_address
    [name, full_address].join ' - '
  end

  def resident_ethnic
    ["'#{resident_ethnics_1}'", "'#{resident_ethnics_2}'"].join(" - ")
  end

  # Begin Class Methods
  module ClassMethods
    def advance_search(options={})
      page                      = options[:page] || 1
      u_address                 = options['address']
      u_types                   = options['types']
      u_care_services           = options['care_services']
      u_service_types           = options['service_types']
      u_feature_and_amenities   = options['feature_and_amenities']
      u_accept_ssi              = options['accept_ssi']
      u_caregivers_languages_2  = options['caregivers_languages_2']
      u_resident_ethnic         = options['resident_ethnics_2']

      u_care_services.delete_if {|item| item == '0'}          if u_care_services.present?
      u_feature_and_amenities.delete_if {|item| item == '0'}  if u_feature_and_amenities.present?


      Tire.search "properties", :load => true, :page => page do |search|
        if u_address.present? || (u_accept_ssi == '1') || u_care_services.present? || u_caregivers_languages_2.present? || u_resident_ethnic.present? || u_feature_and_amenities.present?
          search.query do |query|
            query.boolean do |b|
              b.must { string   "name_and_full_address:*#{u_address}*", default_operator: 'AND' }                 if u_address.present?
              b.must { term     :accept_ssi, u_accept_ssi }                                                       if u_accept_ssi == '1'
              b.must { string   "caregivers_languages_2:*#{u_caregivers_languages_2}", default_operator: 'AND' }  if u_caregivers_languages_2.present?
              b.must { string   "resident_ethnic:*#{u_resident_ethnic}*", default_operator: 'AND' }               if u_resident_ethnic.present?

              (u_care_services || []).each do |cs|
                b.must { string    "care_services:#{cs}" }
              end

              (u_service_types || []).each do |st|
                b.must { string    "service_types:#{st}" }
              end

              (u_feature_and_amenities || []).each do |fa|
                b.must { string    "feature_and_amenities:#{fa}" }
              end
            end
          end
        end

        search.filter :terms, :types                    => ((u_types.class == String) ? [u_types] : u_types)    if u_types.present?
      end
    end
  end
  # end class methods
end