class Public::WorkoutsController < ApplicationController
  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to workout_path(@workout.id)
    else
      render :new
    end
  end

  def edit
  end

  def index
  end

  def show
  end

  private
  def workout_params
    params.require(:workout).permit(:name, :introduction, :image)
  end
end
