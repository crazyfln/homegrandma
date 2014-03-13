class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :determine_layout
  before_filter :prepare_pagination

  private

    def determine_layout
      request.xhr? ? 'ajax' : 'application'
    end

    def prepare_pagination
      @r_page   ||= params[:page]
      @r_limit  ||= params[:limit]
    end
end
