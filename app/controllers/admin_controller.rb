class AdminController < ApplicationController
  layout "admin"
  before_filter :require_user

  helper :admin

  def show
  end


end
