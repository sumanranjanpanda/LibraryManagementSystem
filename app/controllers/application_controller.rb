# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	before_filter :check_login, :except => [:signin,:signup,:create,:index]
private
	def check_login
		unless session[:user_name]
		flash[:notice]="Please Login to continue......"
		redirect_to :controller=>"users",:action=>"signin"
		end
	end
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
