class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role

  def index
    @pets_count = Pet.all.count
    @users_count = User.all.count
    @vets_count = User.where(role: "vet").count
    @appointments_count = Appointment.all.count
  end

  def all_users
    @users = User.all
  end

  def delete_user
    User.find(params[:user_id]).destroy
    redirect_to admin_all_users_path
  end

  def create_vet
    @user = User.new
  end

  def submit_vet
    User.create(user_params)
    redirect_to admin_all_users_path
  end

  private
    def check_role
      if current_user.role != "admin"
        redirect_to main_index_path
      end
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role)
    end
  
end
