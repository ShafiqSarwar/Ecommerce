class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
        def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :current_password, :organization_name, :organization_adress, :organization_adress2, :city, :state, :zip, :donor, :phone_number])
	 	end
end
