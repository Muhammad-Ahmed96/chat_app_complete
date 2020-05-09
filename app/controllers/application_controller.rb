class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # before_action :find_channel


  # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end


  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
    end

    # def configure_permitted_parameters
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    # end

  # def find_channel
  #   debugger
  #   if params[:controller] == "Channel" and params[:id].present?
  #     @channel = Channel.find(params[:id])
  #   end
  # end
end
