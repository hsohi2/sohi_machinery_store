class AccountsController < ApplicationController
  def index
    add_breadcrumb("My Account")
    @addresses = Address.where(user_id: current_user.id)
  end

  def new_address
    @provinces = Province.all
  end

  def add_address
    user_id = current_user.id

    Address.create(address: params[:address], city: params[:city],
                   province_id: params[:province], user_id: user_id)
    redirect_to account_path
  end
end
