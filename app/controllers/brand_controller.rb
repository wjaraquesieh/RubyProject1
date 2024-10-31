class BrandController < ApplicationController
  def index
    @brands = Brand.left_joins(:products)
                 .select("brands.*, COUNT(products.id) AS products_count")
                 .group("brands.id")
                 .page(params[:page]).per(15)
  end
  def show
    @brand = Brand.find(params[:id])
    @products = @brand.products
    @products = @products.page(params[:page]).per(15)
  end
end
