class Admin::WhisperCommentsController < ApplicationController
  def destroy
    WhisperComment.find(params[:id]).destroy
    redirect_to request.referer
  end
end
