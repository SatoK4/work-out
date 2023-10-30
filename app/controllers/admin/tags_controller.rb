class Admin::TagsController < ApplicationController
  def index
    @tag = Tag.new
    @tags = Tag.all
  end
  
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path, success: "新しいタグを追加しました。"
    else
      @tags = Tag.all
      flash.now[:alert] = "タグの追加に失敗しました。"
      render :index
    end
  end
  
  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to admin_tags_path, success: "タグを削除しました。"
  end
  
  private
  def tag_params
    params.require(:tag).permit(:tag_name, tag_ids: [])
  end
  
end
