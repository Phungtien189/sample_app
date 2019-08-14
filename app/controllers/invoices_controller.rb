class InvoicesController < ApplicationController
  def new
    @invoice = Invoice.new
    @invoice.invoice_details.build
    @products = Product.all
  end

  def create
    @invoice= Invoice.new(invoice_params)
    if @invoice.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  # Using strong parameters
  def invoice_params
    params.require(:invoice).permit invoice_details_attributes: [:product_id, :quantity_order, :price_each]
  end
end
