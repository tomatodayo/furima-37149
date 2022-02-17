class Product < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :SendSourceArea
  belongs_to :ProductCategory
  belongs_to :SendDay
  belongs_to :SendLoad
  belongs_to :ProductSituation

  validates :product_title,        presence: true, length: { minimum: 1, maximum: 40 }
  validates :product_concept,      presence: true, length: { minimum: 1, maximum: 1000 }
  validates :product_category_id,  presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :product_situation_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :send_load_id,         presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :send_source_area_id,  presence: true, numericality: { other_than: 1, message: "can't be blank"} 
  validates :send_day_id,          presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :product_price,        presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }
  validates :image,                presence: true
  
end
