class InvoiceDetailsController < ApplicationController
  def new
    @invoice_details = InvoiceDetail.new
  end

  def create
    binding.pry
    @invoice_details= InvoiceDetail.new(invoice_detail_params)
    binding.pry
    if @invoice_details.save
      binding.pry
      redirect_to root_path
    else
      render :new
    end
  end

  private

  # Using strong parameters
  def invoice_detail_params
    params.require(:invoice_detail).permit!
  end
end
