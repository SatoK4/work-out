class Admin::WhispersController < ApplicationController
  def index
    @whispers = Whisper.all
    @whisper = Whisper.find(params[:id])
  end

  def show
  end
end
