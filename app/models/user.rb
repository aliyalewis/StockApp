class User < ApplicationRecord
has_many :stocks, through: :portfolio
has_many :stocks, through: :comments
has_one :watchlist

validate :username, uniqueness: true
validate :email, uniqueness: true


end
