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
  end
end
