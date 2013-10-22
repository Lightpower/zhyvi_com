class AdminController < ApplicationController
  before_filter :check_access

  ##
  # Admin page
  #
  def index
    render :index, layout: 'admin'
  end

  private

  def check_access
    not_found unless current_user.try(:is_admin?)
  end
end
