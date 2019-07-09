class Stock < ApplicationRecord
  has_many :users, through: :comments
  has_many :users, through: :portfolio

  validates :symbol, uniqueness: true
  validates :company_name, uniqueness: true

end
