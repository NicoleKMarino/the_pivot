class UsersController < ApplicationController
  include UsersHelper

  before_action :verify_logged_in, only: [:show]
  before_action :verify_admin, only: [:edit, :update]

  def new
    @user = User.new
  end

  def set_role
    if @role == "1"
      UserRole.create(user_id: @user.id,role_id:2)
    else
      UserRole.create(user_id: @user.id,role_id:1)
    end
  end


  def create
    @user = User.new(user_params)
    if @user.save
      set_role
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.now[:danger] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    if current_user.platform_admin?
      redirect_to admin_dashboard_index_path
    elsif current_user.employer?
      redirect_to employer_dashboard_index_path
  end
end 

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_dashboard_index_path
    else
      render :edit
    end
  end

  private

  def user_params
    @role = params[:user][:user_roles]
    params[:user].delete :user_roles
    params.require(:user).permit(:username, :email, :first_name, :last_name,:address,:city,:zip_code,:state,:password,:user_roles)
  end

end
