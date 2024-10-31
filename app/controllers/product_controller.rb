class ProductController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(15)
  end

  def show
    @product = Product.find(params[:id])
    color_ids = @product.product_color.pluck(:color_id)
    @colors = Color.where(id: color_ids)
  end

  def search
    @query = params[:query]
    @type = params[:type]

    @products = Product.where("name LIKE ?", "%#{@query}%")
    @products = @products.where(product_type: @type) unless @type == "all"
    @products = @products.page(params[:page]).per(15)

    render :index
  end
end
