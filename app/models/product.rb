class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :product_type
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :product_tags
  has_many :tags, through: :product_tags
end
