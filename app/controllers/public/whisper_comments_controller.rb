class Public::WhisperCommentsController < ApplicationController
  def create
    whisper = Whisper.find(params[:whisper_id])
    comment = WhisperComment.new(whisper_comment_params.merge(:customer_id=>current_customer.id, :whisper_id=>whisper.id))
    comment.save
    redirect_to whisper_path(whisper.id)
  end

  def destroy
    WhisperComment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private
  def whisper_comment_params
    params.require(:whisper_comment).permit(:comment)
  end
end
