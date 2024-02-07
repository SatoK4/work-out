class Public::WhispersController < ApplicationController
  before_action :authenticate_customer!, only: [:new]
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

  def edit
    @whisper = Whisper.find(params[:id])
  end

  def update
    @whisper = Whisper.find(params[:id])
    if @whisper.update(whisper_params)
      flash[:success] = "変更しました。"
      redirect_to whisper_path
    else
      flash.now[:alert] = "変更できませんでした。"
      render :edit
    end
  end

  def index
    @whispers = Whisper.page(params[:page]).per(15).order(created_at: :desc)
  end

  def show
    @whisper = Whisper.find(params[:id])
    @whisper_comment = WhisperComment.new
  end

  def destroy
    Whisper.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to whispers_customer_path(current_customer.id)
  end

  private
  def whisper_params
    params.require(:whisper).permit(:content, {images: []} )
  end
end
