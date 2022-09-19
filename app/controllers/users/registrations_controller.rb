# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  respond_to :json
  include RackSessionFix

  def create
    authorize! :admin , current_user
    super
  end
  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?
    
    register_failed
  end

  def register_success
    
    UserMailer.with(user: current_user ).welcome_email.deliver_later

    render json: { message: 'Signed up sucessfully.' }
  end

  def register_failed
    render json: { message: "Something went wrong." }
  end

  protected
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :name, :email, :address, :library, :password, :password_confirmation])
    end
end
