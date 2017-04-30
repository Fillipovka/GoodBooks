class HomeController < ApplicationController
  def index
    @home_page = true if logged_in?
    @last_articles = Article.last(3)
    @last_books = Book.last(5)
  end
end
