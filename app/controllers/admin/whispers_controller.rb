class Admin::WhispersController < ApplicationController
  def index
    @whispers = Whisper.all
  end

  def show
    @whisper = Whisper.find(params[:id])
  end
  
  def destroy
    Whisper.find(params[:id]).delete
    flash[:notice] = "削除しました。"
    redirect_to admin_whispers_path
  end
end
