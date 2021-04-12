require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の登録' do
    context '商品が登録できる場合' do
      it '全ての値が正しければ登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が登録できない場合' do
      it '画像が空であれば登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空であれば登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空であれば登録できない' do
        @item.describe = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Describe can't be blank")
      end

      it 'カテゴリーが空であれば登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーの値が0であれば登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category select')
      end

      it '商品状態が空であれば登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '商品状態の値が0であれば登録できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition select')
      end

      it '配送料負担が空であれば登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it '配送料負担の値が0であれば登録できない' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee select')
      end

      it '発送元地域が空であれば登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送元地域の値が0であれば登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture select')
      end

      it '発送日数が空であれば登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '発送日数の値が0であれば登録できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day select')
      end

      it '販売価格が空であれば登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格の値が300以下であれば登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price out of setting range')
      end

      it '販売価格の値が9,999,999以上であれば登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price out of setting range')
      end

      it '全角数字では登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price half-width number')
      end

      it '半角英数混在では登録できない' do
        @item.price = 'abc123'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price half-width number')
      end

      it '半角英語では登録できない' do
        @item.price = 'abcde'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price half-width number')
      end

      it 'userが紐づいていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
