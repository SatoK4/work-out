class Public::CustomersController < ApplicationController
  def whisper
    @customer = Customer.find(params[:id])
    @whispers = @customer.whispers.all
  end
  
  def workout
  end

  def edit
  end
end
