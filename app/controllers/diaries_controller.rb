class DiariesController < ApplicationController
  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      return redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @diaries = Diary.all
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def diary_params
    params.require(:diary).permit(:image, :content, :start_time).merge(user_id: current_user.id)
  end
end
