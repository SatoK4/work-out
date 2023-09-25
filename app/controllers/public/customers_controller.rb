class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @whispers = @customer.whispers.all
  end

  def edit
  end
end
