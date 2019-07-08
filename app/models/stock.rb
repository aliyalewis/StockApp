class Stock < ApplicationRecord
  has_many :users, through: :comments
  has_many :users, through: :portfolio

end
