class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :authenticate_user!
  allow_browser versions: :modern

  protect_from_forgery with: :exception

  def is_admin?
    user_signed_in? and current_user.email == ENV['ADMIN_EMAIL']
  end

end
