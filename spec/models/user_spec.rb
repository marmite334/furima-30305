require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameとemailとpasswordとpassword_confirmationとfirst_nameとlast_nameとkana_first_nameとkana_last_nameとbirth_dateがあれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが既に存在している値だと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが英数字でも全角では登録できない' do
      @user.password = '７７７ＡＡＡ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = 'aaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが6文字以上でも数字のみでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが6文字以上でもアルファベットのみでは登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'a12345'
      @user.password_confirmation = 'a123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが空だと登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameがアルファベットだと登録できない' do
      @user.first_name = Gimei.first.romaji
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end

    it 'first_nameが数字だと登録できない' do
      @user.first_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end

    it 'last_nameが空だと登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameがアルファベットだと登録できない' do
      @user.last_name = Gimei.last.romaji
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end

    it 'last_nameが数字だと登録できない' do
      @user.last_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end

    it 'kana_first_nameが空だと登録できない' do
      @user.kana_first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end

    it 'kana_first_nameが平仮名だと登録できない' do
      @user.kana_first_name = Gimei.first.hiragana
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana first name Full-width katakana characters')
    end

    it 'kana_first_nameが漢字だと登録できない' do
      @user.kana_first_name = Gimei.first.kanji
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana first name Full-width katakana characters')
    end

    it 'kana_first_nameが数字だと登録できない' do
      @user.kana_first_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana first name Full-width katakana characters')
    end

    it 'kana_last_nameが空だと登録できない' do
      @user.kana_last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name can't be blank")
    end

    it 'kana_last_nameが平仮名だと登録できない' do
      @user.kana_last_name = Gimei.last.hiragana
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana last name Full-width katakana characters')
    end

    it 'kana_last_nameが漢字だと登録できない' do
      @user.kana_last_name = Gimei.last.kanji
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana last name Full-width katakana characters')
    end

    it 'kana_last_nameが数字だと登録できない' do
      @user.kana_last_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana last name Full-width katakana characters')
    end

    it 'birth_dateが空だと登録できない' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
