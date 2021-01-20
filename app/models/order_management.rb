class OrderManagement
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, 
                :postal_code, :prefecture_id, :municipalities, :address, :building, 
                :phone_number, :purchase_management_id,
                :token

  with_options presence: :true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
    validates :item_id
    validates :user_id
  end

  def save
    purchase_management = PurchaseManagement.create(item_id: item_id, user_id: user_id)
    ShippingArea.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities,
                        address: address, building: building, phone_number: phone_number, 
                        purchase_management_id: purchase_management.id)
  end

end