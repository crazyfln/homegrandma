class PropertiesController < ApplicationController

  # GET - property_path(:id)
  #
  def show
    property
    @message       = Message.new
    @staffs        = User.limit(10)
  end



  # GET - searches_path
  #
  def searches
    @property = Property.new property_params
    @properties = if params[:property].blank?
      params[:property] ||= {}
      Property.includes(:property_photos, :property_room_types, :property_service_types).
               order("RANDOM()").
               page(params[:page]).per(6)
    else
      Property.advance_search(params[:property].merge(:page => params[:page])).results
    end
  end


  private

    # preopulate selected property
    def property
      @property ||= Property.find params[:id]
    end

    # property params
    def property_params
      params.require(:property).permit(:name, :address, :types, :vacant_vacility, :accept_ssi, :caregivers_languages_2, :resident_ethnics_2,
                                       :care_services => [],
                                       :feature_and_amenities => []) if params[:property].present?
    end
end
