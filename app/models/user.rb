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

  PASSWORD_REGEX = /(?=.*?[a-z])(?=.*?[\d])/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  NAME = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates_format_of :first_name, with: NAME
  validates_format_of :last_name, with: NAME
  validates_format_of :kana_first_name, with: NAME
  validates_format_of :kana_last_name, with: NAME

  has_many :products
  has_many :users
  
end
