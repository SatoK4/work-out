class Public::WhisperCommentsController < ApplicationController
  def create
    whisper = Whisper.find(params[:whisper_id])
    comment = WhisperComment.new(whisper_comment_params.merge(:customer_id=>current_customer.id, :whisper_id=>whisper.id))
    if  comment.save
      flash[:success] = "コメントをしました。"
      redirect_to whisper_path(whisper.id)
    else
      flash[:alert] = "投稿に失敗しました。"
      redirect_to request.referer
    end
  end

  def destroy
    WhisperComment.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to request.referer
  end

  private
  def whisper_comment_params
    params.require(:whisper_comment).permit(:comment)
  end
end
