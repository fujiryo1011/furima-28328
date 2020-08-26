class Item < ApplicationRecord

  has_one :comment
  has_one :buyer

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :comment, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :state_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_fee_id, numericality: { other_than: 1, message: 'Select' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :until_shipping_id, numericality: { other_than: 1, message: 'Select' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end
