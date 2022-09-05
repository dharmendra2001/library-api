# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params
 
  respond_to :json


  private

  
  def respond_with(resource, _opts = {})
    if current_user
      render json: { message: 'You are logged in.' }, status: :ok
    else
      render json: { message: 'somthing is wrong'}, status: 200
    end
  end

  def respond_to_on_destroy
    log_out_success && return if current_user
    
    log_out_failure
  end

  def log_out_success
    render json: { message: "You are logged out." }, status: :ok
  end

  def log_out_failure
    render json: { message: "Hmm nothing happened."}, status: :unauthorized
  end

  # protected
  # def configure_sign_in_params
  #     devise_parameter_sanitizer.permit(:sign_in, keys: [:id, :password])
  # end
end
