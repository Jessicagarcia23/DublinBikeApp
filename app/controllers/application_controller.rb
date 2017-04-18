class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
def after_sign_in_path_for(resource)
"/signedincustomerprofile"
end

def ensure_admin
 redirect_to root_path, alert: 'Access Denied' unless current_customer

end

end
