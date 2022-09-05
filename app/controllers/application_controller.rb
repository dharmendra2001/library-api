class ApplicationController < ActionController::API
  rescue_from CanCan::AccessDenied do |exception|
    render json: {message: "access denied you are not admin?"}
  end
  
  rescue_from ActiveRecord::RecordNotUnique do |exception|
    render json: {message: "email already exists"}
  end

  rescue_from  ActiveRecord::RecordNotFound do |exception|
    render json: {message: "books already retured"}
  end
  
end
