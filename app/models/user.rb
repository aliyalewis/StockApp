class User < ApplicationRecord
has_many :stocks, through: :portfolio
has_many :stocks, through: :comments
has_one :watchlist


end
