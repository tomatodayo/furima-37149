class BuyAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :product_id

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :post_code, format: {with:/\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A[0-9]{11}\z/}
  end
  validate :building

  def save
    buy = Buy.create(user_id: user_id, product_id: product_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, buy_id: buy.id)
  end
end