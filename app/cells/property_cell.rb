class PropertyCell < Cell::Rails
  helper PropertiesHelper

  def contact_property_manager(options)
    @property             = Property.find(options[:property_id])
    @property_manager     = @property.user
    @message              = @property.messages.new
    render
  end

  def nearby_listing
    @properties           = Property.includes(:property_photos).order("RANDOM()").limit("10")
    render
  end

end
