class CreatePortfolioStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolio_stocks do |t|

      t.timestamps
    end
  end
end