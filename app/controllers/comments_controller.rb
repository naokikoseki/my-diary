class CommentsController < ApplicationController
  def create
    def create
      comment = Comment.create(comment_params)
      redirect_to "/diaries/#{comment.diary.id}"  # コメントと結びつくツイートの詳細画面に遷移する
    end
  
    private
    def comment_params
      params.require(:comment).permit(:comment, :diary_id).merge(user_id: current_user.id, diary_id: diary.id)
    end
  end
end
