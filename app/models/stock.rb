class Stock < ApplicationRecord
  has_many :users, through: :comments
  has_many :users, through: :portfolio
  has_many :comments
  # has_many :portfolios_stocks
  # has_many :portfolios, through: :portfolios_stocks

  validates :symbol, uniqueness: true

end
