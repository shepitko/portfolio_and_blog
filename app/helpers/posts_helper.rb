module PostsHelper
  def admin_user?
    return true if user_signed_in? && current_user.admin?
    false 
  end
end
