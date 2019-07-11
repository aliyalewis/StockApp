class Portfolio < ApplicationRecord
  has_one :user
  has_many :portfolios_stocks
  has_many :stocks, through: :portfolios_stocks
end
