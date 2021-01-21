require 'rails_helper'

RSpec.describe OrderManagement, type: :model do
  describe '商品の購入' do
    before do
      @order_management = FactoryBot.build(:order_management)
    end

    context '商品が購入できるとき' do
      it '必要な情報を適切に入力すると商品の購入ができる' do
        expect(@order_management).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_management.building = nil
        @order_management.valid?
      end
    end

    context '商品が購入できないとき' do
      it 'item_idが空では購入できない' do
        @order_management.item_id = nil
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空では購入できない' do
        @order_management.user_id = nil
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenが空では購入できない' do
        @order_management.token = nil
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では購入できない' do
        @order_management.postal_code = nil
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに-が無いと購入できない' do
        @order_management.postal_code = '2892114'
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeは数字と-以外の場合購入できない' do
        @order_management.postal_code = 'ああああ'
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空では購入できない' do
        @order_management.prefecture_id = nil
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1では購入できない' do
        @order_management.prefecture_id = 1
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include('Prefecture Select')
      end
      it 'municipalitiesが空では購入できない' do
        @order_management.municipalities = nil
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空では購入できない' do
        @order_management.address = nil
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order_management.phone_number = nil
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10文字以下では購入できない' do
        @order_management.phone_number = 111
        @order_management.valid?
      end
      it 'phone_numberが12文字以上では購入できない' do
        @order_management.phone_number = 111_111_111_111
        @order_management.valid?
      end
      it 'phone_numberに-があると購入できない' do
        @order_management.phone_number = 111 - 1111 - 1111
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが数字でない場合購入できない' do
        @order_management.phone_number = 'ああああ'
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include('Phone number Input only number')
      end
      it 'purchase_management_idが空では購入できない' do
        @order_management.purchase_management_id = nil
        @order_management.valid?
      end
    end
  end
end
