class Item < ApplicationRecord

  has_one_attached :image

  with_options presence:true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :comment , length: { maximum: 1000 }
    validates :category_id
    validates :state_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :until_shipping_id
    validates :price, numericality: { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999 }
  end
end
