class Private::PropertiesController < Private::ModuleController

  # POST -
  #
  def like
    @status  = nil
    @success = if current_user.like_property?(property)
      @status = 'dislike'
      current_user.dislike_property!(property)
    else
      @status = 'like'
      current_user.like_property!(property)
    end
  end


  private

    # prepopulate property
    def property
      @property ||= Property.find params[:id]
    end
end