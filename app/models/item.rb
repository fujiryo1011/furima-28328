class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer

  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :until_shipping_fee

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :comment, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :state_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_fee_id, numericality: { other_than: 1, message: 'Select' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :until_shipping_fee_id, numericality: { other_than: 1, message: 'Select' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
