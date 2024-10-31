class CategoryController < ApplicationController
  def index
    @categories = Category.left_joins(:products)
                 .select("categories.*, COUNT(products.id) AS products_count")
                 .group("categories.id")
                 .page(params[:page]).per(15)
  end
  def show
    @category = Category.find(params[:id])
    @products = @category.products
    @products = @products.page(params[:page]).per(15)
  end
end
