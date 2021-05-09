require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#new' do
    before do
      # user_id = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
    end

    context '出品ができる時' do

      it 'name,product_detail,price,category_id,status_id,postage_id,prefecture_id,shipment_idが存在すれば出品できること' do
        expect(@item).to be_valid
      end

      it 'priceが¥300~¥9,999,999の間のみ出品可能であること' do
        @item.price = '3000'
        expect(@item).to be_valid
      end

      it 'priceが半角英数字のみ出品可能であること' do
        @item.price = '25000'
        expect(@item).to be_valid
      end
    end

    context '出品できない時' do

      it 'imageが空では出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nicknameが空では出品できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'product_detailが空では出品できないこと' do
        @item.product_detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product detail can't be blank")
      end

      it 'category_idが1だと出品できないこと' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'status_idが1だと出品できないこと' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it 'postage_idが1だと出品できないこと' do
        @item.postage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end

      it 'prefecture_idが1だと出品できないこと' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'shipment_idが1だと出品できないこと' do
        @item.shipment_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment must be other than 1")
      end

      it 'priceが空だと出品できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが¥300未満だと出品できないこと' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが¥9,999,999以上だと出品できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'priceが半角英数字でないと出品できないこと' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'userが紐付いていないと出品できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
