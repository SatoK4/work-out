class Admin::WhispersController < ApplicationController
  def index
    @whispers = Whisper.all
  end

  def show
    @whisper = Whisper.find(params[:id])
  end
end
