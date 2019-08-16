class Product < ApplicationRecord
  has_many :invoice_details
  validates :quantity,
    numericality: {greater_than_or_equal_to: 0}
end
