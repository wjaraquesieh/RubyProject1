class ProductController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @query = params[:query]
    @type = params[:type]

    @products = Product.where("name LIKE ?", "%#{@query}%")
    @products = @products.where(type: @type) unless @type == "all"

    render :index
  end
end
