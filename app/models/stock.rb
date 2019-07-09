class Stock < ApplicationRecord
  has_many :users, through: :comments
  has_many :users, through: :portfolio

  validate :symbol, uniqueness: true
  validate :company_name, uniqueness: true

end
