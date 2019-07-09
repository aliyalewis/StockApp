class Stock < ApplicationRecord
  has_many :users, through: :comments
  has_many :users, through: :portfolio

  validates :symbol, uniqueness: true

  def stock_info
    
  end

end
