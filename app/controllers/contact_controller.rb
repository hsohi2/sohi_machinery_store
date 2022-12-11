class ContactController < ApplicationController
  def index
    @contact = Contact.all
    add_breadcrumb('Contact')
  end
end
