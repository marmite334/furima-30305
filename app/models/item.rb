class Item < ApplicationRecord
  validates        :name,          presence: true
  validates        :explanation,   presence: true
  validates        :price,         presence: true
  validates        :category_id, numericality: { other_than: 1 } 
  validates        :state_id,      presence: true
  validates        :charges_id,    presence: true
  validates        :prefecture_id, presence: true
  validates        :days_id,       presence: true
  belongs_to       :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :category
  has_one_attached :image
end
