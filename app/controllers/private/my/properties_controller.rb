class Private::My::PropertiesController < Private::ModuleController

  # GET - edit_my_property_path(:id)
  #
  def edit
    property
  end

  # POST - step1_my_properties_path
  def step2
    params[:property][:types] = "" if params[:property][:types].length == 1 && params[:property][:types][0] == ""
    property.attributes = property_params
    property.step = 1


    if property.save
      property.property_photos.build          if property.property_photos.blank?

      if property.property_room_types.length < 3
        if property.property_room_types.length == 0
          property.property_room_types.build(name: 'Small Bedroom')
          property.property_room_types.build(name: 'Medium Bedroom')
          property.property_room_types.build(name: 'Large Bedroom')
        else
          (3 - property.property_room_types.length).times do
            property.property_room_types.build
          end
        end
      end

      if property.property_service_types.length < 3
        if property.property_service_types.length == 0
          property.property_service_types.build(name: 'Low Level Care')
          property.property_service_types.build(name: 'Medium Level Care')
          property.property_service_types.build(name: 'High Level Care')
        else
          (3 - property.property_service_types.length).times do
            property.property_service_types.build
          end
        end
      end

    else
      flash[:error] = property.errors.full_messages
      render action: :edit
    end
  end

  # POST - step2_my_property_path(:id)
  #
  def update
    unless property.update_attributes property_params.merge({step: 2})
      flash[:error] = property.errors.full_messages
      render action: :step2
    end
  end


  private

    # We need to set it first, because for the current system,
    # each user will only have 1 property
    # if they want to add more, so please just register new one
    #
    def property
      # @property ||= current_user.properties.find params[:id]
      @property ||= current_user.properties.first
      @property ||= current_user.properties.new property_params
      @property
    end


    # Filter param property
    def property_params
      if params[:property].present?
        params.require(:property).permit(:name, :address, :city, :state_code, :zip, :phone_number, :phone_number_2, :vacancies, :accept_ssi, :include_service_charge,
                                         :add_person_fee, :buy_in_fee, :community_fee, :respite_fee, :capacity, :description,
                                         :resident_ethnics_1, :caregivers_languages_1, :caregivers_languages_2, :license_number,
                                         :resident_ethnics_2, :step, :types, :property_manager_name, :property_manager_avatar,
                                         :care_services         => [],
                                         :dinnings              => [],
                                         :types                 => [],
                                         :room_types            => [],
                                         :service_types         => [],
                                         :feature_and_amenities => [],
                                         :property_photos_attributes        => [:photo, :_destroy, :id, :primary],
                                         :property_room_types_attributes    => [:name, :price_start_at, :_destroy, :id],
                                         :property_service_types_attributes => [:name, :price_start_at, :_destroy, :id]
                                        )
      end
    end


end
