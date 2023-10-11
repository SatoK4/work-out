class Public::WhispersController < ApplicationController
  def new
    @whisper = Whisper.new
  end

  def create
    @whisper = Whisper.new(whisper_params.merge(:customer_id=>current_customer.id))
    if @whisper.save
      flash[:success] = "つぶやきました。"
      redirect_to whisper_path(@whisper.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @whispers = Whisper.all
  end

  def show
    @whisper = Whisper.find(params[:id])
    @customer = @whisper.customer
  end

  def destroy
    Whisper.find(params[:id]).delete
    flash[:success] = "削除しました。"
    redirect_to whispers_customer_path(current_customer.id)
  end

  private
  def whisper_params
    params.require(:whisper).permit(:content, {images: []} )
  end
end
