class ContactController < ApplicationController
  before_action :authenticate_user!
  def index
    @contact = Contact.all
  end
end
