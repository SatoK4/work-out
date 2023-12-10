class Public::WorkoutBookmarksController < ApplicationController
  def create
    @bookmark = WorkoutBookmark.new(bookmark_params.merge(:customer_id=>current_customer.id))
    if @bookmark.valid?
      @bookmark.save
      flash[:success] = "ブックマークを登録しました。"
      redirect_to request.referer
    end
  end

  def destroy
    @bookmark = WorkoutBookmark.find(params[:id])
    if @bookmark.destroy
      flash[:success] = "ブックマークを削除しました。"
      redirect_to request.referer
    end
  end

  private
  def bookmark_params
    params.permit(:workout_id)
  end
end
