require 'csv'

Product.delete_all

filename = Rails.root.join("db/products-2022-11-25.csv")
puts "Loading products data from csv file #{filename}"

csv_data = File.read(filename)
products_data = CSV.parse(csv_data, headers:true, encoding:"utf-8")

products_data.each do |p|
  product = Product.create(
    product_id: p["Product_Id"],
    category_id: p["Category_Id"],
    product_name: p["Product_Name"],
    product_description: p["Product_Description"],
    product_price: p["Product_Price"],
    product_image: p["Product_Image"],
    product_likes: p["Product_Likes"]
  )
end

puts "Loading data from csv file #{filename} completed."


#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?