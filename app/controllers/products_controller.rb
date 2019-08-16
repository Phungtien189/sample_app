class ProductsController < ApplicationController
  before_action :load_product, except: [:index, :new, :create]

  def index
    @products = Product.all
  end

  def update
      if @product.update_attributes product_patams
        redirect_to root_path
      else
        redirect_to root_path
      end

    end

  private

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    redirect_to root_path
  end

  def product_patams
    params.require(:product).permit!
  end
end
