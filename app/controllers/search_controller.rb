class SearchController < ApplicationController
	
 def index
 	@categories = Category.all
 	@search_query = params[:search]
 end
 
 def show
 
 end


end