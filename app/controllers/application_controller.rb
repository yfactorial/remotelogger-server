class ApplicationController < ActionController::Base
  
  include ExceptionNotifiable
  
  helper :all
  protect_from_forgery
  
  # Let our views use thse methods
  helper_method :current_user, :logged_in?
  
  # Always watch for redirect_tos
  before_filter :save_redirect_to, :set_timezone
  
  #-- Authentication support

  def current_user
    @current_user ||= logged_in? ? User.find(session[:user_id]) : nil
  end

  def current_account
    @current_account ||= current_user.account
  end
  
  def logged_in?
    (@logged_in ||= (!session[:user_id].blank? and User.exists?(session[:user_id])) ? 1 : 0) > 0
  end
  
  # Log this user in
  def login(user)
    session[:user_id] = user.id
    @logged_in = nil
  end
  
  def logout
    session[:user_id] = nil
    @logged_in = nil
  end
  
  #-- Session state helpers
  
  def redirect_back_or(location)
    back = session[:redirect_to]
    redirect_to(back || location)
    session[:redirect_to] = nil
  end
  
  #-- Paging
  
  def paging_params
    opts = { :page => params[:page] || 1 }
    opts = opts.merge(:per_page => params[:per_page]) if params[:per_page]
    opts
  end
  
  #-- Common filters
  
  def set_timezone
    Time.zone = current_user.time_zone if logged_in?
  end
  
  def save_redirect_to
    session[:redirect_to] = params[:redirect_to] if params[:redirect_to]
  end
  
  def require_logged_in
    if not logged_in?
      respond_to do |wants|
        wants.html do
          flash[:error] = "You must be logged-in to access that page."
          session[:redirect_to] = request.request_uri
          redirect_to login_path
        end
        wants.js { head :status => 401 }
      end
    end
  end

end
