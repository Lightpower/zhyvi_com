class AdminsController < ApplicationController
  include Adminable

  before_filter :check_access

  ##
  # Admin page
  #
  def index
  end

  private

  def check_access
    not_found unless current_user.try(:is_admin?)
  end
end
