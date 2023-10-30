class Admin::WorkoutCommentsController < ApplicationController
  def destroy
    WorkoutComment.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to request.referer
  end

end
