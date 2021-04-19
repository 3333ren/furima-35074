require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
  end

  describe '商品の購入' do
    context '商品が購入できる場合' do
      it '全ての値が正しければ登録できる' do
        expect(@order).to be_valid
      end

      it '建物名の値が空でも登録できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it '郵便番号の値が空であれば登録できない' do
        @order.postal_cord = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal cord can't be blank")
      end

      it '郵便番号の値にハイフンがなければ登録できない' do
        @order.postal_cord = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal cord harf-width number. include hyphen(-)')
      end

      it '郵便番号の値が数値でなければ登録できない' do
        @order.postal_cord = 'abc-defg'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal cord harf-width number. include hyphen(-)')
      end

      it '都道府県の値が空であれば登録できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県の値が0であれば登録できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture select')
      end

      it '市区町村の値が空であれば登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '番地の値が空であれば登録できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号の値が空であれば登録できない' do
        @order.telephone = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone can't be blank")
      end

      it '電話番号の値が12桁以上であれば登録できない' do
        @order.telephone = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone maximum is 12 characters')
      end

      it '電話番号の値が数値のみでなければ登録できない' do
        @order.telephone = '123456789ab'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone half-width number')
      end

      it 'user_idの値が空であれば登録できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idの値が空であれば登録できない' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

      it 'クレジットカード情報の値が空であれば登録できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
