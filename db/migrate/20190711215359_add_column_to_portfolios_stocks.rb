class AddColumnToPortfoliosStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios_stocks, :shares, :integer
  end
end
