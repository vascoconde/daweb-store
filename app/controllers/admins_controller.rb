class AdminsController < ApplicationController
  before_filter :authorize_admin
    
  def index
  	@categories = Category.all
  	@manufacturers = Manufacturer.all
  end

end
