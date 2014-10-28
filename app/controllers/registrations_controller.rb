
class RegistrationsController < Devise::RegistrationsController


  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) do |user|
  		user.permit(:username, :bio, :personal_website, :email, :password, :password_confirmation, :profile_photo)
  	end

  	devise_parameter_sanitizer.for(:account_update) do |user|
  		user.permit(:username, :bio, :personal_website, :email, :password, :password_confirmation, :profile_photo)
  	end
  end

end