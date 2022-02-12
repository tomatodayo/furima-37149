class Product < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :day
  belongs_to :load
  belongs_to :situation

  validates :product_title,        presence: true
  validates :product_concept,      presence: true
  validates :product_category_id,  presence: true
  validates :product_situation_id, presence: true
  validates :send_load_id,         presence: true
  validates :send_source_area_id,  presence: true
  validates :send_day_id,          presence: true
  validates :product_price,        presence: true
  validates :image,                presence: true
  validates :area_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :day_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :load_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank"} 

end
