class CommunitiesController < ApplicationController
  def index
    @diaries = Diary.all
  end
end
