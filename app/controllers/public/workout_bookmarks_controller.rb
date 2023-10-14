class Public::WorkoutBookmarksController < ApplicationController
  def index
  end
  
  def create
    @bookmark = current_customer.bookmarks.build(bookmark_params)
    if @bookmark.valid?
      @bookmark.save
      flash[:success] = "ブックマークを登録しました。"
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:success] = "ブックマークを削除しました。"
    end
  end
  
  private
  def bookmark_params
    params.permit(:workout_id)
  end
end
