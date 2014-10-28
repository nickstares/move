class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:username, :bio, :personal_website, :email, :password, :password_confirmation, :profile_photo)
    end

    # devise_parameter_sanitizer.for(:account_update).push(:username, :bio, :personal_website, :email, :password, :password_confirmation, :profile_photo)
    # end
  # end

end