require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#new' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品ができる時' do

      it 'name,product_detail,price,category_id,status_id,postage_id,prefecture_id,shipment_idが存在すれば出品できること' do
        expect(@item).to be_valid
      end

      it 'priceが¥300~¥9,999,999の間のみ出品可能であること' do
        @item.price = 3000
        expect(@item).to be_valid
      end

      it 'priceが半角英数字のみ出品可能であること' do
        @item.price = 25000
        expect(@item).to be_valid
      end
    end

    context '出品できない時' do

      it 'imageが空では出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it 'nicknameが空では出品できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it 'product_detailが空では出品できないこと' do
        @item.product_detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'category_idが1だと出品できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end

      it 'status_idが1だと出品できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end

      it 'postage_idが1だと出品できないこと' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end

      it 'prefecture_idが1だと出品できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end

      it 'shipment_idが1だと出品できないこと' do
        @item.shipment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end

      it 'priceが空だと出品できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください", "価格は不正な値です", "価格は数値で入力してください")
      end

      it 'priceが¥300未満だと出品できないこと' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end

      it 'priceが¥9,999,999以上だと出品できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end

      it 'priceが半角英数字でないと出品できないこと' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end

      it 'userが紐付いていないと出品できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
