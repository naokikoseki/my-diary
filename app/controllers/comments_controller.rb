class CommentsController < ApplicationController
    def create
      @diary = Diary.find(params[:diary_id])
      @comment = @diary.comments.build(comment_params)
      if @comment.save
        ActionCable.server.broadcast 'comment_channel', content: @comment
      end
      
    end
  
    private
    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id, diary_id: params[:diary_id])
    end
end
