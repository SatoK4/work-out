class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def whisper
    @customer = Customer.find(params[:id])
    @whispers = @customer.whispers.all
  end

  def workout
    @customer = Customer.find(params[:id])
    @workouts = @customer.workouts.all
  end

  def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: !@customer.is_deleted)
    if @customer.is_deleted
      flash[:notice] = "退会処理を実行しました。"
    else
      flash[:notice] = "有効にします。"
    end
    redirect_to request.referer
  end
end
