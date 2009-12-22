class ApplicationController < ActionController::Base
  protect_from_forgery  # See ActionController::RequestForgeryProtection for details

  helper :layout

  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user
  before_filter :set_page

  def load_flash
    render :partial => "layouts/flash"
  end

  def help
    Helper.instance
  end

  class Helper
    include Singleton
    include ActionView::Helpers::AssetTagHelper 
  end
  
  protected
  
  def set_page
    @posts = Post.active
    if session[:support_registered]
      @hide_sidebar_form = true
      @supporter = Supporter.new
    else
      @supporter = Supporter.new
    end
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to admin_index_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end
