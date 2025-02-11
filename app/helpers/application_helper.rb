module ApplicationHelper
  def is_admin?
    user_signed_in? and ENV["ADMIN_EMAIL"].downcase == current_user.email.downcase
  end
end
