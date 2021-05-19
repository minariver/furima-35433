require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '入力内容に問題ない場合' do
      it 'postal_code,prefecture_id,city,address,phone_numberがあれば購入できる' do
        expect(@order_address).to be_valid
      end

      it 'building_nameが無くてもpostal_code,prefecture_id,city,address,phone_numberがあれば購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '入力内容に問題がある場合' do
      it 'postal_codeが空だと購入できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください", "郵便番号は不正な値です")
      end

      it 'postal_codeにハイフンを含まないと購入できないこと' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は不正な値です")
      end

      it 'prefecture_idが1だと購入できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end

      it 'cityが空だと購入できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'addressが空だと購入できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end

      it 'phone_numberが空だと購入できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください", "電話番号は数値で入力してください")
      end

      it 'phone_numberが11桁以上だと購入できないこと' do
        @order_address.phone_number = "123456789112"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は11文字以内で入力してください")
      end

      it 'phone_numberが数値でないと購入できないこと' do
        @order_address.phone_number = "1234sxde567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は数値で入力してください")
      end

      it "tokenが空だと購入できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end

      it 'userが紐付いていないと購入できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end

      it 'itemが紐付いていないと購入できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
