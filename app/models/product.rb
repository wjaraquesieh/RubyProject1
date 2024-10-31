class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :product_type
  belongs_to :category
  has_many :product_tags
  has_many :tags, through: :product_tags
  has_many :product_color
  has_many :color, through: :product_colors
end
