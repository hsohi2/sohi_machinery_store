class AboutController < ApplicationController
  def index
    @about = About.all
    add_breadcrumb("About")
  end
end
