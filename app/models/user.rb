class User < ApplicationRecord
  has_many :user_items
  has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: 'is invalid. Include both letters and numbers' } do
    validates :password
  end

  with_options presence: true do
    validates :nickname
    validates :name_last_kanji, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
    validates :name_first_kanji, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
    validates :name_last_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
    validates :name_first_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
    validates :birth_date
  end
end
