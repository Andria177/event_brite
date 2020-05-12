class RegistrationsController < Devise::RegistrationsController
    protected
  
    
    def after_sign_out_path_for(resource_name)

      '/users' # Or :prefix_to_your_route
    end
  end