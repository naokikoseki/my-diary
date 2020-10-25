require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context "新規登録できるとき" do
      it "nickname, email, password, password_confirmationが存在すれば新規登録ができる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録できないとき" do
      #nickname
      it "nicknameが存在しなければ新規登録ができない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "nicknameが20文字より長いとき新規登録ができない" do
        @user.nickname = "アイウエオカキクケコサシスセソタチツテトナ"
        @user.valid?
        expect(@user.errors.full_messages)
      end

      #email
      it "emailが存在しなければ新規登録ができない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "すでに登録されているemailは登録できない" do
        @user.save
        another_user =FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages)
      end
      it "emailに@が含まれていないとき新規登録ができない" do
        @user.email = "email"
        @user.valid?
        expect(@user.errors.full_messages)
      end

      #password
      it "passwordが存在しなければ新規登録ができない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "passwordが5文字以下では新規登録ができない" do
        @user.password = "abc12"
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "passwordが英字だけでは新規登録ができない" do
        @user.password = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "passwordが数字だけでは新規登録ができない" do
        @user.password = "1234567"
        @user.valid?
        expect(@user.errors.full_messages)
      end

      #password_confirmation
      it "password_confirmationが存在しなければ新規登録ができない" do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "passwordとpassword_confirmationが一致しなければ新規登録ができない" do
        @user.password = "sample1234"
        @user.password_confirmation = "example9876"
        @user.valid?
        expect(@user.errors.full_messages)
      end
    end
  end
end
