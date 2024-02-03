require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    context '商品が出品できないとき' do
      it 'ログイン状態でないと登録できない' do

        user = FactoryBot.create(:user)


        item = FactoryBot.build(:item, user: user)
        item.valid?

        expect(item.errors.full_messages).to include('Please log in to proceed')
      end
    end
  end
end