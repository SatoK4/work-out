class Public::CustomersController < ApplicationController
  def whisper
    @customer = Customer.find(params[:id])
    @whispers = @customer.whispers.page(params[:page]).per(15)
  end

  def whisper_bookmark
    @customer = Customer.find(current_customer.id)
    bookmarks = WhisperBookmark.where(customer_id: current_customer.id).pluck(:whisper_id)
    @whisper_bookmarks = Whisper.find(bookmarks)
    @whisper_bookmarks = Kaminari.paginate_array(@whisper_bookmarks).page(params[:page]).per(15)
  end

  def workout
    @customer = Customer.find(params[:id])
    @workouts = @customer.workouts.page(params[:page]).per(10)
  end

  def workout_bookmark
    @customer = Customer.find(params[:id])
    bookmarks = WorkoutBookmark.where(customer_id: current_customer.id).pluck(:workout_id)
    @workout_bookmarks = Workout.find(bookmarks)
    @workout_bookmarks = Kaminari.paginate_array(@workout_bookmarks).page(params[:page]).per(10)
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to whispers_customer_path(@customer.id)
  end

  def unsubscribe
  end

  def withdrawal
    current_customer.update(is_deleted: 'true')
    reset_session
    flash[:success] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:nickname, :self_introduction, :image)
  end
end
