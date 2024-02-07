class Public::WorkoutsController < ApplicationController
  before_action :authenticate_customer!, only: [:new]
  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params.merge(:customer_id=>current_customer.id))
    if @workout.save
      flash[:success] = "投稿に成功しました"
      redirect_to workout_path(@workout.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def index
    @workouts = params[:tag_id].present? ? Tag.find(params[:tag_id]).workouts : Workout.page(params[:page]).per(10).order(created_at: :desc)
    if params[:keyword]
      @workouts = @workouts.search(params[:keyword]).page(params[:page]).per(10).order(created_at: :desc)
    else
      @workouts = @workouts.page(params[:page]).per(10).order(created_at: :desc)
    end
    @keyword = params[:keyword]
  end

  def show
    @workout = Workout.find(params[:id])
    @workout_comment = WorkoutComment.new
  end

  def destroy
    Workout.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to workouts_customer_path(current_customer.id)
  end

  private
  def workout_params
    params.require(:workout).permit(:name, :introduction, {images: []}, tag_ids: [] )
  end
end
