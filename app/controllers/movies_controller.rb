class MoviesController < ApplicationController
  def show
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:id])
    @bookmark = Bookmark.find_by(list: @list, movie: @movie)
  end
end
