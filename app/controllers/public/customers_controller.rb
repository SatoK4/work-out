class Public::CustomersController < ApplicationController
  def whisper
    @customer = Customer.find(params[:id])
    @whispers = @customer.whispers.all
  end

  def workout
    @customer = Customer.find(params[:id])
    @workouts = @customer.workouts.all
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
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:nickname, :self_introduction)
  end
end
