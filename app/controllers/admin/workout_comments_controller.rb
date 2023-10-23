class Admin::WorkoutCommentsController < ApplicationController
  def destroy
    WorkoutComment.find(params[:id]).destroy
    redirect_to request.referer
  end

end
