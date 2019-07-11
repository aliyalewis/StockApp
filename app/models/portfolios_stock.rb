class PortfoliosStock < ApplicationRecord
    belongs_to :stock, required: false
    belongs_to :portfolio, required: false
end
