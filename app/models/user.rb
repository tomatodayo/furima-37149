class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  validates :nickname,        presence: true
  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :kana_first_name, presence: true
  validates :kana_last_name,  presence: true
  validates :birth_day,       presence: true

  PASSWORD_REGEX = /(?=.*?[a-zA-Z])(?=.*?[\d])/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  has_many :products
  has_many :users
  
end
