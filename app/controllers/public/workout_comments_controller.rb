class Public::WorkoutCommentsController < ApplicationController
  def create
    workout = Workout.find(params[:workout_id])
    comment = WorkoutComment.new(workout_comment_params.merge(:customer_id=>current_customer.id, :workout_id=>workout.id))
    if comment.save
      flash[:success] = "コメントをしました。"
      redirect_to workout_path(workout.id)
    else
      flash[:alert] = "投稿に失敗しました。"
      redirect_to request.referer
    end
  end

  def destroy
    WorkoutComment.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to request.referer
  end

  private
  def workout_comment_params
    params.require(:workout_comment).permit(:comment)
  end
end
