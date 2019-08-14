class InvoiceForm
  include ActiveModel::Model
  include Virtus

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  # Attributes (DSL provided by Virtus)
  attribute :allprice, Integer
  attribute :invoice_id, Integer
  attribute :product_id, Integer
  attribute :quantity_order, Integer
  attribute :price_each, Integer
  attribute :paramsx, String



  def save
    persist!
    true
  end

  private

  def persist!
    invoice = Invoice.create()
    for i in 0..(paramsx.count-1)
        invoice.invoice_details.create(paramsx.to_a[i][1])
    end
  end
end
