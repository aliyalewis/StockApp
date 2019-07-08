class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.integer :stock_id
      t.integer :user_id

      t.timestamps
    end
  end
end
