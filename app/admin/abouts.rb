ActiveAdmin.register About do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title1, :description1, :title2, :description2
  #
  # or
  #
  # permit_params do
  #   permitted = [:title1, :description1, :title2, :description2]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
