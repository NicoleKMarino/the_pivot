class UsersController < ApplicationController
  before_action :verify_logged_in, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_role
      session[:user_id] = @user.id
      assign_bucket_applications_to_user
      redirect_to dashboard_path
    else
      flash.now[:danger] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    redirect_to employer_dashboard_index_path if current_user.employer?
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

    def user_params
      @role = params[:user][:user_roles]
      params[:user].delete :user_roles
      params.require(:user).permit(
        :username,
        :email,
        :first_name,
        :last_name,
        :address,
        :city,
        :zip_code,
        :state,
        :password
      )
    end

    def set_role
      if @role == "1"
        @employer = Role.find_by(name: "employer")
        UserRole.create!(user_id: @user.id, role_id: @employer.id)
      else
        @registered = Role.find_by(name: "registered_user")
        UserRole.create!(user_id: @user.id, role_id: @registered.id)
      end
    end
end
