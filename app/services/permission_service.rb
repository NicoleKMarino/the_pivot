require 'pry'
class PermissionService
  attr_reader :user

  def initialize(user)
    @user= user || User.create
  end

  def allow?(controller)
    case
    when user.platform_admin?
      platform_admin_permissions(controller)
    when user.employer?
      employer_permissions(controller)
    when user.registered_user?
      registered_user_permissions(controller)
    else
      guest_user_permissions(controller)
    end
  end

  private

  def platform_admin_permissions(controller)
    return true 
    # return true if controller == "companies"
    # return true if controller == "sessions"
    # return true if controller == "orders"
    # return true if controller == "jobs"
    # return true if controller == "users"
    # return true if controller == "homes"
  end

  def employer_permissions(controller)
    return true
    # return true if controller == "companies"
    # return true if controller == "sessions"
    # return true if controller == "jobs"
    # return true if controller == "orders"
    # return true if controller == "homes"

  end

  def registered_user_permissions(controller)
    return true
    # return true if controller == "sessions"
    # return true if controller == "companies"
    # return true if controller == "sessions"
    # return true if controller == "jobs"
    # return true if controller == "homes"

  end

  def guest_user_permissions(controller)
    return true
    # return true if controller == "companies"
    # return true if controller == "sessions"
    # return true if controller == "homes"

  end
end
