require "csv"

Category.delete_all
Product.delete_all

filename = Rails.root.join("db/categories-2022-12-16.csv")
Rails.logger.debug "Loading products data from csv file #{filename}"

csv_data = File.read(filename)
categories_data = CSV.parse(csv_data, headers: true, encoding: "utf-8")

categories_data.each do |c|
  Category.create(
    category_name:       c["Category_name"],
    category_description: c["Category_description"]
  )
end

Rails.logger.debug "Loading data from csv file #{filename} completed."


filename = Rails.root.join("db/products-2022-11-25.csv")
Rails.logger.debug "Loading products data from csv file #{filename}"

csv_data = File.read(filename)
products_data = CSV.parse(csv_data, headers: true, encoding: "utf-8")

products_data.each do |p|
  Product.create(
    product_id:          p["Product_Id"],
    category_id:         p["Category_Id"],
    product_name:        p["Product_Name"],
    product_description: p["Product_Description"],
    product_price:       p["Product_Price"]
  )
end

Rails.logger.debug "Loading data from csv file #{filename} completed."

AdminUser.create!(email: 'admin@example.comm', password: 'password') if Rails.env.development?
