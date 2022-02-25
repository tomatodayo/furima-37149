class Buy < ApplicationRecord
  has_one :address
  belongs_to :product
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
