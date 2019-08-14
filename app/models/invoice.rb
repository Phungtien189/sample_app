class Invoice < ApplicationRecord
  has_many :invoice_details, dependent: :destroy
  accepts_nested_attributes_for :invoice_details
end
