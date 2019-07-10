class User < ApplicationRecord
has_many :stocks, through: :portfolio
has_many :comments
has_many :stocks, through: :comments
has_one :watchlist

validates :username, uniqueness: true
validates :email, uniqueness: true

has_secure_password

end
