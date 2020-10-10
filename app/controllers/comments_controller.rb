class CommentsController < ApplicationController
  def create
    def create
      @comment = Comment.create(comment_params)
      if @comment.save
        ActionCable.server.broadcast 'comment_channel', comment: @comment
      end
      redirect_to "/diaries/#{diary.id}"  # コメントと結びつくツイートの詳細画面に遷移する
    end
  
    private
    def comment_params
      params.require(:comment).permit(:comment).merge(user_id: current_user.id, diary_id: params[:diary_id])
    end
  end
end
