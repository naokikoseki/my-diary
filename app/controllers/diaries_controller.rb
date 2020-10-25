class DiariesController < ApplicationController
  before_action :move_to_community, except: [:community, :show]
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  
  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      return redirect_to diaries_path
    else
      render 'new'
    end
  end

  def index
    @diaries = Diary.all
  end

  def show
    if not(user_signed_in?) && @diary.opened == "0"
      redirect_to action: :community
    elsif @diary.opened == "0" && not(current_user.id == @diary.user.id)
      redirect_to action: :community
    end
    @comment = Comment.new
    @comments = @diary.comments.order("created_at ASC")
  end

  def edit
    unless current_user.id == @diary.user.id
      redirect_to action: :community
    end
  end

  def update
    if @diary.update(diary_params)
      redirect_to diaries_path
    else
      render 'edit'
    end
  end

  def destroy
    if @diary.destroy
      redirect_to diaries_path
    else
      render 'show'
    end
  end

  def community
    @likes_count = Like.where(@diary).count
    @diaries = Diary.all.order("start_time DESC")
    render 'community'
  end

  def search
    @diaries = Diary.search(params[:keyword]).order("start_time DESC")
  end

  private
  def diary_params
    params.require(:diary).permit(:title, :content, :start_time, :open, images: []).merge(user_id: current_user.id)
  end

  def move_to_community
    unless user_signed_in?
      redirect_to action: :community
    end
  end

  def set_diary
    @diary = Diary.find(params[:id])
  end
end
