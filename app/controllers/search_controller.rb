class SearchController < ApplicationController
	
	def search
	  if params[:q].nil?
	    @search_books = []
	    @search_author = []
	  else
	    @search_books = Book.search params[:q]
	    @search_author = Author.search params[:q]
	  end
	end
end
