class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "is invalid. Include both letters and numbers" }
         validates :nickname, presence: true
         validates :name_last_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龠]+\z/, message: 'is invalid. Input full-width characters' }
         validates :name_first_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龠]+\z/, message: 'is invalid. Input full-width characters' }
         validates :name_last_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters" }
         validates :name_first_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters" }
         validates :birth_date, presence: true
end