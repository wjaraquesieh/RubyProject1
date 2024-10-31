class Color < ApplicationRecord
  has_many :product_color
  has_many :product, through: :product_color
end
