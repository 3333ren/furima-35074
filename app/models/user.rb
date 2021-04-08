class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: 'include both letters and numbers' }
  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'full-width characters' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'full-width characters' }
    validates :first_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'full-width katakana characters' }
    validates :last_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'full-width katakana characters' }
    validates :birthday, presence: true
  end
end
