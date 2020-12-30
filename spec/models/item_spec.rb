require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品が保存できる場合' do
      it 'imageとnameとexplanationとpriceとcategory_idとstate_idとcharges_idとprefecture_idとdays_idがあれば保存できる' do
      end
    end
    context '商品が保存できない場合' do
      it 
end
