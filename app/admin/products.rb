ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :product_id, :category_id, :product_name, :product_description, :product_price, :product_image, :product_likes, :image
  #

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.inputs do
      f.input :image, as: :file
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
  # or
  #
  # permit_params do
  #   permitted = [:product_id, :category_id, :product_name, :product_description, :product_price, :product_image, :product_likes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
