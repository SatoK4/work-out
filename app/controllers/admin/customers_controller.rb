class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end
  
  def whisper
    @customer = Customer.find(params[:id])
    @whispers = Whisper.all
  end
  
  def workout
    @customer = Customer.find(params[:id])
    @workouts = Wourkout.all
  end
  
  def destroy
    Customer.find(params[:id]).delete
    flash[:notice] = "削除しました。"
    redirect_to admin_customers_path
  end
end
