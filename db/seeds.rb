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

# Loop to get the information
CSV.foreach('db/csv/tag.csv', headers: true) do |row|
  Tag.create(tagName: row['tag_name'])
end
CSV.foreach('db/csv/brand.csv', headers: true) do |row|
  Brand.create(description: row['description'])
end

# 50.times do
#   Product.create(
#     name: Faker::Commerce.product_name,
#     price: Faker::Commerce.price(range: 5.0..50.0),
#     description: Faker::Lorem.paragraph
#   )
# end
