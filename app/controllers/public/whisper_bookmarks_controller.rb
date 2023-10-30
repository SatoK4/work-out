class Public::WhisperBookmarksController < ApplicationController
  def index
  end

  def create
    @bookmark = WhisperBookmark.new(bookmark_params.merge(:customer_id=>current_customer.id))
    if @bookmark.valid?
      @bookmark.save
      flash[:success] = "ブックマークを登録しました。"
      redirect_to request.referer
    end
  end

  def destroy
    @bookmark = WhisperBookmark.find(params[:id])
    if @bookmark.destroy
      flash[:success] = "ブックマークを削除しました。"
      redirect_to request.referer
    end
  end

  private
  def bookmark_params
    params.permit(:whisper_id)
  end
end
