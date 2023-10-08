class Public::WorkoutsController < ApplicationController
  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params.merge(:customer_id=>current_customer.id))
    if @workout.save!
      redirect_to workout_path(@workout.id)
    else
      flash[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def destroy
    Workout.find(params[:id]).destroy
    redirect_to workouts_customer_path(current_customer.id)
  end

  private
  def workout_params
    params.require(:workout).permit(:name, :introduction, {images: []} )
  end
end
