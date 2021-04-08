require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'nicknameに値が存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが英数字混在していなければ登録できない' do
      @user.password = '1234567'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password include both letters and numbers')
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = 'abc12'
      @user.password_confirmation = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが6文字以上であれば登録できる' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      expect(@user).to be_valid
    end

    it 'passwordとpassword_confirmationが不一致の場合登録できない' do
      @user.password = 'abc123'
      @user.password_confirmation = 'def456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'メールアドレスが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複のメールアドレスが存在する場合登録できない' do
      @user.save
      user2 = FactoryBot.build(:user, email: @user.email)
      user2.valid?
      expect(user2.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスに@が含まれていなければ登録できない' do
      @user.email = 'test11'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角(漢字、ひらがな、カタカナ)入力でなければ登録できない' do
      @user.first_name = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name full-width characters')
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameが全角(漢字、ひらがな、カタカナ)入力でなければ登録できない' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name full-width characters')
    end

    it 'first_name_furiganaが空では登録できない' do
      @user.first_name_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana can't be blank")
    end

    it 'first_name_furiganaが全角(カタカナ)入力でなければ登録できない' do
      @user.first_name_furigana = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name furigana full-width katakana characters')
    end

    it 'last_name_furiganaが空では登録できない' do
      @user.last_name_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
    end

    it 'last_name_furiganaが全角(カタカナ)入力でなければ登録できない' do
      @user.last_name_furigana = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name furigana full-width katakana characters')
    end

    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it '生年月日に値があれば登録できる' do
      expect(@user).to be_valid
    end
  end
end
