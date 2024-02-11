require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it '全ての値が正しく入力されている' do
        expect(@order).to be_valid
        expect(@order.errors.full_messages).to_not include "can't be blank"
      end

      it '建物名に入力がされていなくても購入できる' do
        @order_order_building = ""
        expect(@order).to be_valid
        expect(@order.errors.full_messages).to_not include "can't be blank"
      end
    end      

    context '商品が購入できないとき' do
      it 'tokenが空では購入できない' do
        @order.token = nil
        @order.valid?
      end     

      it 'order_postcodeが空では購入できない' do
        @order.order_postcode = ""
        @order.valid?
      end

      it 'order_postcodeは3桁-4桁の半角数字以外では購入できない' do
        @order.order_postcode = "0000000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Order postcode is invalid. Enter it as follows (e.g. 123-4567)")
      end
      
      it 'prefecture_idが初期値では購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'order_cityが空では購入できない' do
        @order.order_city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Order city can't be blank")
      end

      it 'order_addressが空では購入できない' do
        @order.order_address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Order address can't be blank")
      end

      it 'order_phone_numberが空では購入できない' do
        @order.order_phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Order phone number can't be blank")
      end

      it 'order_phone_numberが9文字以下では購入できない' do
        @order.order_phone_number = "000000000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Order phone number is too short")
      end

      it 'order_phone_numberが12文字以上では購入できない' do
        @item_order.order_phone_number = "123456789101"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Order phone number is too long")
      end
      
      it 'order_phone_numberが半角数字以外では購入できない' do 
        @order.order_phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Order phone number is invalid. Input only number")
      end
      
      it 'user_idが空では購入できない'do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できない'do
      @item_order.item_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
