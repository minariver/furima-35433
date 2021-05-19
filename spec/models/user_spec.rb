require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

  context 'ユーザ登録ができる時' do

    it 'nicknameとemail、passwordとpassword_confirmation、first_name、famiy_name、first_name_kana、famiy_name_kana、birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'emailが@を含めば登録できること' do
      @user.email = 'abcde@google.com'
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上且つ半角英数字を含めば登録できること' do
      @user.password = 'n1n1n1'
      @user.password_confirmation = 'n1n1n1'
      expect(@user).to be_valid
    end
  end

  context 'ユーザ登録ができない時' do

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end  

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'emailが@が含まれていないと登録ができないこと' do
      @user.email = '11111.test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'passwordが5文字以下では登録できないこと' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードは不正な値です")
    end

    it 'passwordが半角英数字を含まないと登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it 'passwordが半角英字のみの場合は登録できないこと' do
      @user.password = 'abcdefg'
      @user.password_confirmation = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it 'passwordが全角の場合は登録できないこと' do
      @user.password = '８abd13'
      @user.password_confirmation = '８abd13'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください", "名前は不正な値です")
    end

    it "first_nameが全角出ないと登録できないこと" do
      @user.first_name = 'abe'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は不正な値です")
    end

    it "famiy_nameが空では登録できないこと" do
      @user.famiy_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください", "名字は不正な値です")
    end

    it "famiy_nameが全角出ないと登録できないこと" do
      @user.famiy_name = 'def'
      @user.valid?
      expect(@user.errors.full_messages).to include("名字は不正な値です")
    end

    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(カタカナ)を入力してください", "名前(カタカナ)は不正な値です")
    end

    it "first_name_kanaが全角出ないと登録できないこと" do
      @user.first_name_kana = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(カタカナ)は不正な値です")
    end

    it "first_name_kanaは全角（カタカナ以外）では登録できないこと" do
      @user.first_name_kana = 'あいう'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(カタカナ)は不正な値です")
    end

    it "famiy_name_kanaが空では登録できないこと" do
      @user.famiy_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字(カタカナ)を入力してください", "名字(カタカナ)は不正な値です")
    end

    it "famiy_name_kanaが全角出ないと登録できないこと" do
      @user.famiy_name_kana = '456'
      @user.valid?
      expect(@user.errors.full_messages).to include("名字(カタカナ)は不正な値です")
    end

    it "famiy_name_kanaは全角（カタカナ以外）では登録できないこと" do
      @user.famiy_name_kana = 'かきく'
      @user.valid?
      expect(@user.errors.full_messages).to include("名字(カタカナ)は不正な値です")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
  end 
end
