class User < ApplicationRecord

  has_one :comment
  has_one :buyer

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  zenkaku = /\A[ぁ-んァ-ヶー一-龠]+\z/
  zenkaku_kana = /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/

  with_options presence: true do
    validates :nickname
    validates :firstname, format: { with: zenkaku }
    validates :lastname, format: { with: zenkaku }
    validates :first_name_kana, format: { with: zenkaku_kana }
    validates :last_name_kana, format: { with: zenkaku_kana }
    validates :birthday
  end

  # validates :email, presence: true, uniqueness: true, inclusion: { in: "@" }
  validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/ }
end
