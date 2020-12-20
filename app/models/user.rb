class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence:true
  validates :password, format: { with: /[a-z\d]{6,}/i, message: 'Password Include both letters and numbers' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'First name Full-width characters' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Last name Full-width characters' }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Kana first name Full-width katakana characters' }
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Kana last name Full-width katakana characters' }
  validates :birth_date, presence:true
end
