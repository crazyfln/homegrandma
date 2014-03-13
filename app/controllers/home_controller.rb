class HomeController < ApplicationController

  def show
     @properties = Property.order("created_at DESC").limit(3)
  end
end
