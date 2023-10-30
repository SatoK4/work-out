class Admin::WorkoutsController < ApplicationController
  def show
    @workout = Workout.find(params[:id])
  end
  
  def destroy
    Workout.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to admin_root_path
  end
end
