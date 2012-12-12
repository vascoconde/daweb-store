class SearchController < ApplicationController
	
 def index
 	@categories = Category.all
 	@search_query = params[:search]
 	@products = Product.where("name LIKE ?", "%#{@search_query}%")

 end

end