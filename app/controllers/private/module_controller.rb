class Private::ModuleController < ApplicationController
  before_filter :authenticate_user!
end
