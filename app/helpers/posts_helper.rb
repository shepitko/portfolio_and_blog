module PostsHelper
  def admin_user?
    current_user.try(:admin)
  end
end
