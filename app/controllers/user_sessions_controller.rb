class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create], :except => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash.message = "Login successful!"
      redirect_back_or_default admin_session_url
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to root_url
  end

end
