require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('test/fixtures/files/test_image.jpg')
  end

  describe '商品の保存' do
    context '商品が保存できる場合' do
      it 'imageとnameとexplanationとpriceとcategory_idとstate_idとcharges_idとprefecture_idとdays_idがあれば保存できる' do
        expect(@item).to be_valid
      end

      it 'nameが40文字以下で保存できる' do
        @item.name = Faker::Name.initials(number: 40)
        @item.valid?
      end

      it 'explanationが1000文字以下で保存できる' do
        @item.explanation = Faker::Name.initials(number: 1000)
        @item.valid?
      end
    end

    context '商品が保存できない場合' do
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが41文字以上で保存できない' do
        @item.name = Faker::Name.initials(number: 41)
        @item.valid?
      end

      it 'explanationが空だと保存できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'explanationが1001文字以上で保存できない' do
        @item.explanation = Faker::Name.initials(number: 1001)
        @item.valid?
      end

      it 'category_idが空だと保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが1だと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'state_idが空だと保存できない' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it 'state_idが1だと保存できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State Select')
      end

      it 'charges_idが空だと保存できない' do
        @item.charges_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Charges can't be blank")
      end

      it 'charges_idが1だと保存できない' do
        @item.charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Charges Select')
      end

      it 'prefecture_idが空だと保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1だと保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end

      it 'days_idが空だと保存できない' do
        @item.days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end

      it 'days_idが1だと保存できない' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days Select')
      end

      it 'priceが空だと保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299以下では保存できない' do
        @item.price = Faker::Number.within(range: 0..299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceが10000000以上だと保存できない' do
        @item.price = Faker::Number.number(digits: 8)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceが数値以外では登録できない' do
        @item.price = Faker::String.random
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
    end
  end
end
