require 'rails_helper'

RSpec.describe Diary, type: :model do
  describe "create" do
    before do
      @diary = FactoryBot.build(:diary)
    end
   
   context "保存できるとき" do
     it "images,title,content,open,start_timeが存在すれば日記が保存できる" do
       expect(@diary).to be_valid
     end

     it "imagesがなくても日記が保存できる" do
       @diary.images = nil
       expect(@diary).to be_valid
     end
   end

   context "保存できないとき" do
     it "titleがなければ日記が保存できない" do
       @diary.title = nil
       @diary.valid?
       expect(@diary.errors.full_messages)
     end

     it "contentがなければ日記が保存できない" do
       @diary.content = nil
       @diary.valid?
       expect(@diary.errors.full_messages)
     end

     it "openがなければ日記が保存できない" do
       @diary.open = nil
       @diary.valid?
       expect(@diary.errors.full_messages)
     end

     it "openが0,1以外のとき保存できない" do
       @diary.open = "2"
       @diary.valid?
       expect(@diary.errors.full_messages)
     end

     it "start_timeがなければ日記が保存できない" do
       @diary.start_time = nil
       @diary.valid?
       expect(@diary.errors.full_messages)
     end
   end
  end
end
