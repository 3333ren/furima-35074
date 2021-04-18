class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_cord, :prefecture_id, :city, :address, :building, :telephone, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'harf-width number. include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'select' }
    validates :city
    validates :address
    validates :telephone, numericality: { only_integer: true, message: 'half-width number' },
                          length: { maximum: 11, message: 'maximum is 12 characters' }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_cord: postal_cord, prefecture_id: prefecture_id, city: city, address: address, building: building,
                    telephone: telephone, purchase: purchase)
  end
end
