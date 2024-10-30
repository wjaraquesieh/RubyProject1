# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'
# require 'faker'

# Clean all the data
Tag.destroy_all
Brand.destroy_all
ProductType.destroy_all
Category.destroy_all

# Loop to get the information
CSV.foreach('db/csv/tag.csv', headers: true) do |row|
  Tag.create(tagName: row['tag_name'])
end
CSV.foreach('db/csv/brand.csv', headers: true) do |row|
  Brand.create(description: row['description'])
end
CSV.foreach('db/csv/product_type.csv', headers: true) do |row|
  ProductType.create(description: row['description'])
end
CSV.foreach('db/csv/category.csv', headers: true) do |row|
  Category.create(description: row['description'])
end

# 50.times do
#   Product.create(
#     name: Faker::Commerce.product_name,
#     price: Faker::Commerce.price(range: 5.0..50.0),
#     description: Faker::Lorem.paragraph
#   )
# end

require 'net/http'
require 'json'

# Clean the records
ProductTag.delete_all
ProductColor.delete_all
Product.delete_all

url = URI("http://makeup-api.herokuapp.com/api/v1/products.json")
response = Net::HTTP.get(url)
products = JSON.parse(response)

products.each do |product_data|
  # Find or create associated records
  brand = Brand.find_or_create_by(description: product_data["brand"])
  product_type = ProductType.find_or_create_by(description: product_data["product_type"])
  category = Category.find_or_create_by(description: product_data["category"])

  # Create Product
  product = Product.create(
    name: product_data["name"],
    brand: brand,
    product_type: product_type,
    category: category,
    price: product_data["price"].to_f,
    currency: product_data["currency"],
    image: product_data["image_link"],
    link: product_data["product_link"],
    description: product_data["description"],
    rating: product_data["rating"].to_f
  )

  # Handle tags
  product_data["tag_list"].each do |tag_name|
    tag = Tag.find_or_create_by(tagName: tag_name)
    ProductTag.create(product: product, tag: tag)
  end

  # Handle colors
  product_data["product_colors"].each do |color_data|
    color = Color.find_or_create_by(hex_value: color_data["hex_value"], colorName: color_data["colour_name"])
    ProductColor.create(product: product, color: color)
  end
end
