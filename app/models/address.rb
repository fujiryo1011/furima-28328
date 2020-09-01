class Address < ApplicationRecord
  belongs_to :buyer

  with_options presence: true do
    validates :postalcoad, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone, format: { with: /\A^0\d{9,10}$\z/ }
  end
end
