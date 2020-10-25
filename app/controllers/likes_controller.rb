class LikesController < ApplicationController
  before_action :set_diary
  
  def create
    @like = Like.create(user_id: current_user.id, diary_id: params[:diary_id])
    @likes = Like.where(post_id: params[:post_id])
    @diary.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, diary_id: params[:diary_id])
    like.destroy
    @likes = Like.where(diary_id: params[:diary_id])
    @diary.reload
  end

  private

  def set_diary
    @diary = Diary.find(params[:diary_id])
  end
end
