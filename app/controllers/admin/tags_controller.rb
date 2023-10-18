class Admin::TagsController < ApplicationController
  def index
    @tag = Tag.new
    @tags = Tag.all
  end
  
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path, notice: "新しいタグを追加しました。"
    else
      @tags = Tag.all
      flash.now[:alert] = "タグの追加に失敗しました。"
      render :index
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end
  
  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to admin_tags_path, notice: "タグの更新に成功しました。"
    else
      flash.now[:alert] = "タグの更新に失敗しました。"
      render :edit
    end
  end
  
  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to admin_tags_path, notice: "タグを削除しました。"
  end
  
  private
  def tag_params
    params.require(:tag).permit(:name, tag_ids: [])
  end
  
end
