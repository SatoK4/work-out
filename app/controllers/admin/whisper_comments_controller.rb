class Admin::WhisperCommentsController < ApplicationController
  def destroy
    WhisperComment.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to request.referer
  end
end
