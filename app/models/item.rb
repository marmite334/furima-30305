class Item < ApplicationRecord
  validates       :name,          presence: true
  validates       :explanation,   presence: true
  validates       :price,         presence: true
  validates       :category_id,   presence: true
  validates       :state_id,      presence: true
  validates       :charges_id,    presence: true
  validates       :prefecture_id, presence: true
  validates       :days_id,       presence: true
  belongs_to      :user
  has_on_attached :image
end
