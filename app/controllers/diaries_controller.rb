class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  
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
  end

  def edit
  end

  def update
    if @diary.update(diary_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @diary.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  private
  def diary_params
    params.require(:diary).permit(:image, :content, :start_time).merge(user_id: current_user.id)
  end

  def set_diary
    @diary = Diary.find(params[:id])
  end
end
