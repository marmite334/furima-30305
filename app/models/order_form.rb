class OrderManagements
  
  include ActiveModel::Model
  attr_accessor :item, :user, :postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :purchase_management

  with_options presence: :true do
    :item
    :user
    :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    :municipalities
    :address
    :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
    :purchase_management
  end

  def save
    user = Purchase_managements.create(user: user)
    item = Purchase_managements.create(item: item)
    Shipping_areas.create(postal_code: postal_code, prefecture_id: prefecutre_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, purchase_management: purchase_management)
  end

end