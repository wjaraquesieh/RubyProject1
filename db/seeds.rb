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

# Clean all the data
Tag.destroy_all
Brand.destroy_all

# Going through the csv file
csv_tag = Rails.root.join('db/tag.csv')
csv_dataTag = File.read(csv_tag)
tag = CSV.parse(csv_dataTag, headers: true)

csv_brand = Rails.root.join('db/brand.csv')
csv_dataBrand = File.read(csv_brand)
brand = CSV.parse(csv_dataBrand, headers: true)

# Loop to get the information
tag.each do |row|
  Tag.create(
    tag_name: row['tag_name'],
  )
end

brand.each do |row|
  Brand.create(
    description: row['description'],
  )
end
