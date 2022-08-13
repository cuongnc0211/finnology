class ArticlesController < ApplicationController
  def index
    @spotlight = Article.spotlights.newest.first || Article.newest.first
    @pagy, @articles = pagy(Article.newest.where.not(id: @spotlight&.id))
  end

  def show
    @article = Article.find_by(id: params[:id])
  end
end