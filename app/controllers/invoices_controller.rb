class InvoicesController < ApplicationController
  def new
    @invoice = Invoice.new
    @invoice.invoice_details.build
    @products = Product.all
  end

  def create
    @invoice= Invoice.new(invoice_params)
    ActiveRecord::Base.transaction do
      @invoice.save
      @update_products = invoice_params.to_h[:invoice_details_attributes].values
      for i in 0..(@update_products.count-1)
        @product = Product.find(@update_products[i][:product_id])
        @product.update_attributes(quantity: @product.quantity - @update_products[i][:quantity_order].to_i)
      end
      redirect_to new_invoice_path
    end
    rescue
      render :new
  end

  private

  # Using strong parameters
  def invoice_params
    params.require(:invoice).permit :allprice, invoice_details_attributes: [:product_id, :quantity_order, :price_each, :_destroy]
  end
end
