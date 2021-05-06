require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemail、passwordとpassword_confirmation、first_name、famiy_name、first_name_kana、famiy_name_kana、birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'emailが@を含めば登録できる' do
      @user.email = 'abcde@google.com'
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上且つ半角英数字を含めば登録できること' do
      @user.password = 'n1n1n1'
      @user.password_confirmation = 'n1n1n1'
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end  

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数字を含まないと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_nameが全角出ないと登録できないこと" do
      @user.first_name = 'abe'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "famiy_nameが空では登録できないこと" do
      @user.famiy_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Famiy name can't be blank")
    end

    it "famiy_nameが全角出ないと登録できないこと" do
      @user.famiy_name = 'def'
      @user.valid?
      expect(@user.errors.full_messages).to include("Famiy name is invalid")
    end

    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "first_name_kanaが全角出ないと登録できないこと" do
      @user.first_name_kana = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "famiy_name_kanaが空では登録できないこと" do
      @user.famiy_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Famiy name kana can't be blank")
    end

    it "famiy_name_kanaが全角出ないと登録できないこと" do
      @user.famiy_name_kana = '456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Famiy name kana is invalid")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end 
end
