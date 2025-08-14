class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list), notice: 'Movie added to the list!'

    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
