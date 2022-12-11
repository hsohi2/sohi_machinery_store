ActiveAdmin.register Product do

  permit_params :product_id, :category_id, :product_name, :product_description, :product_price, :image

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :category, label: "Category", collection: Category.all.map { |c| [c.category_name, c.id] }
      f.input :product_name, label: "Product Name"
      f.input :product_description, label: "Product Description"
      f.input :product_price, label: "Product Price"
      f.input :image, as: :file, label: "Image"
    end
    f.actions
  end
end
