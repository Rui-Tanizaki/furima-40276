require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it 'item_nameが入力されている' do
        expect(@item).to be_valid
        expect(@item.errors.full_messages).to_not include "can't be blank"
      end

      it 'item_infoが入力されている' do
        expect(@item).to be_valid
        expect(@item.errors.full_messages).to_not include "can't be blank"
      end 

      it 'item_infoが入力されている' do
        expect(@item).to be_valid
        expect(@item.errors.full_messages).to_not include "can't be blank"
      end 

      it 'item_category_idが入力されている' do
        expect(@item).to be_valid
        expect(@item.errors.full_messages).to_not include "can't be blank"
      end 

      it 'item_sales_status_idが入力されている' do
        expect(@item).to be_valid
        expect(@item.errors.full_messages).to_not include "can't be blank"
      end 
      
      it 'item_shipping_fee_status_idが入力されている' do
        expect(@item).to be_valid
        expect(@item.errors.full_messages).to_not include "can't be blank"
      end 

      it 'prefecture_idが入力されている' do
        expect(@item).to be_valid
        expect(@item.errors.full_messages).to_not include "can't be blank"
      end

      it 'item_scheduled_delivery_idが入力されている' do
        expect(@item).to be_valid
        expect(@item.errors.full_messages).to_not include "can't be blank"
      end 
    end

    context '商品が出品できないとき' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it 'item_infoが空では登録できない' do
        @item.item_info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item info can't be blank"
      end

      it 'item_priceが空では登録できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price can't be blank"
      end

      it 'item_category_idが空では登録できない' do
        @item.item_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item category can't be blank"
      end

      it 'item_sales_status_idが空では登録できない' do
        @item.item_sales_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item sales status can't be blank"
      end

      it 'item_shipping_fee_status_idが空では登録できない' do
        @item.item_shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item shipping fee status can't be blank"
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'item_scheduled_delivery_idが空では登録できない' do
        @item.item_scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item scheduled delivery can't be blank"
      end
    end
  end
end