class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :product_type
  belongs_to :category
end
