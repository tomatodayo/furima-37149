class Product < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :day
  belongs_to :load
  belongs_to :situation

  validates :product_title,        presence: true, length: { minimum: 1, maximum: 40 }
  validates :product_concept,      presence: true, length: { minimum: 1, maximum: 1000 }
  validates :product_category_id,  presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :product_situation_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :send_load_id,         presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :send_source_area_id,  presence: true, numericality: { other_than: 1, message: "can't be blank"} 
  validates :send_day_id,          presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :product_price,        presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :image,                presence: true
  
  PRODUCT_PRICE = /[0-9]/i.freeze
  validates_format_of :product_price, with: PRODUCT_PRICE

end
