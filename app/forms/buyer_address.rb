class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postalcoad, :prefecture_id, :city, :house_number, :building, :phone, :token, :item_id, :user_id

  with_options presence: true do
    validates :postalcoad, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone, format: { with: /\A^0\d{9,10}$\z/ }
    validates :token
  end

  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    Address.create(postalcoad: postalcoad, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone: phone, buyer_id: buyer.id)
  end
end
