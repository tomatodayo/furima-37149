class BuyAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :product_id, :token

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :post_code,     format: {with:/\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: {other_than: 1}
    validates :city
    validates :block
    validates :phone_number,  format: {with: /\A[0-9]{10,11}\z/}
    validates :token
  end
  
  def save
    buy = Buy.create(user_id: user_id, product_id: product_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, buy_id: buy.id)
  end
end