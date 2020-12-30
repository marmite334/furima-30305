class Item < ApplicationRecord
  with_options presence: true do
    validates        :name
    validates        :explanation
    validates        :price,         format: { with: /\A([1-9]\d*)*[1-9]\d*\z/, message: 'Half-width number' },
                                     inclusion: { in: 300..9_999_999,   message: 'Out of setting range' }
    validates        :category_id,   numericality: { other_than: 1,     message: 'Select' }
    validates        :state_id,      numericality: { other_than: 1,     message: 'Select' }
    validates        :charges_id,    numericality: { other_than: 1,     message: 'Select' }
    validates        :prefecture_id, numericality: { other_than: 1,     message: 'Select' }
    validates        :days_id,       numericality: { other_than: 1,     message: 'Select' }
  end
  belongs_to       :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :category
  belongs_to       :state
  belongs_to       :charge
  belongs_to       :prefecture
  belongs_to       :days
end
