class Buy < ApplicationRecord
  has_one :send
  belongs_to :product
  belongs_to :user
end
