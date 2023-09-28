class Public::WhispersController < ApplicationController
  def new
    @whisper = Whisper.new
  end
  
  def create
    @whisper = Whisper.new(whisper_params)
    if @whisper.save
      redirect_to whisper_path(@whisper.id)
    else
      render :new
    end
  end

  def index
  end

  def show
  end
end
