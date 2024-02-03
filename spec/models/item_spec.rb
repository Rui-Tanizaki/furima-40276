require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it '全ての値が正しく入力されている' do
        expect(@item).to be_valid
        expect(@item.errors.full_messages).to_not include "can't be blank"
      end
    end

    context '商品が出品できないとき' do
      it 'ユーザーが紐づいていない場合は登録できない' do
        @item = FactoryBot.build(:item, user: nil)
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'imageが空では登録できない' do
        @item = FactoryBot.build(:item, image: nil)        
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
        
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

      it 'item_category_idが空では登録できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item category can't be blank"
      end

      it 'item_sales_status_idが空では登録できない' do
        @item.item_sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item sales status can't be blank"
      end

      it 'item_shipping_fee_status_idが空では登録できない' do
        @item.item_shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item shipping fee status can't be blank"
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'item_scheduled_delivery_idが空では登録できない' do
        @item.item_scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item scheduled delivery can't be blank"
      end
      
      it 'item_priceが空では登録できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price can't be blank"
      end

      it 'item_priceが半角数字以外では登録できない' do
        @item.item_price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is not a number"
      end

      it 'item_priceが300円未満では登録できない' do
        @item.item_price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price must be greater than or equal to 300"
      end

      it 'item_priceが9_999_999円を超えると登録できない' do
        @item.item_price = "10_000_000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price must be less than or equal to 9999999"
      end
    end
  end
end