class HomeController < ApplicationController
  def index
    @home_page = true if logged_in?
    @last_articles = Article.last(4)
    @tags = Tag.last(68)
  end
end
