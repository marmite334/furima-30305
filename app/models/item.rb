class Item < ApplicationRecord
  with_options presence: true do
    validates        :name
    validates        :explanation
    validates        :price,         format: { with: /\A([1-9]\d*)*[1-9]\d*\z/, message: 'Half-width number' },
                                     inclusion: { in: 300..9_999_999,   message: 'Out of setting range' }
    with_options numericality: { other_than: 1, message: 'Select' } do
      validates        :category_id
      validates        :state_id
      validates        :charges_id
      validates        :prefecture_id
      validates        :days_id
    end
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
