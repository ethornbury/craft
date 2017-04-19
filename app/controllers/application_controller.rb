class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  config.relative_url_root = ""  
  #this is required when you have link for favicon
  
  #putting this method here makes it available across whole application
  def ensure_admin
    unless current_user && current_user.admin?
    
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Please contact the administrator to complete this action.' }
        format.json { head :no_content }
      end
    end
  end
  
  def admin?
    admin
  end 
end