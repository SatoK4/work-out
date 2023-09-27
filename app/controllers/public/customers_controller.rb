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
  end
end
