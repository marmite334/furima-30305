class Item < ApplicationRecord
  validates        :name,          presence: true
  validates        :explanation,   presence: true
  validates        :price,         presence: true
  validates        :category_id,   numericality: { other_than: 1 ,message: 'Select'} 
  validates        :state_id,      numericality: { other_than: 1 ,message: 'Select'} 
  validates        :charges_id,    numericality: { other_than: 1 ,message: 'Select'} 
  validates        :prefecture_id, numericality: { other_than: 1 ,message: 'Select'} 
  validates        :days_id,       numericality: { other_than: 1 ,message: 'Select'} 
  belongs_to       :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :category
  belongs_to       :state
  belongs_to       :charge
  belongs_to       :prefecture
  belongs_to       :days  
end
