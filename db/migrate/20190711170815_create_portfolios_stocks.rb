class CreatePortfoliosStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :portfoliosstocks do |t|
      t.references :stock, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
