class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  # validates :email, presence: true, uniqueness: true, inclusion: { in: "@" }
  validates :password, length: { minimum: 6}, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/ }
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/ }
  validates :lastname, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/ }
  validates :birthday, presence: true

end
