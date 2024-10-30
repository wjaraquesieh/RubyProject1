class ProductTypeController < ApplicationController
  def index
    @product_types = ProductType.all
    render json: @product_types
  end
end
