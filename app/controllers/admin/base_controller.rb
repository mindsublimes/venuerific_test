class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  layout :determine_layout
  before_action :check_admin_user

  def determine_layout
    "admin"
  end
  
  def check_admin_user
    if !current_user.admin?
      redirect_to root_path
    end
  end
end