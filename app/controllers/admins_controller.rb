class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update]

  def show
    redirect_to items_path unless current_admin?
  end

  def edit
  end

  def update
    if @admin.update(admin_params)
      flash[:notice] = "You have successfully updated your user details."
      redirect_to admin_path
    else
      render :edit
    end
  end

  private

  def set_admin
    @admin = current_user if current_admin?
  end

  def admin_params
    params.require(:user).permit(:full_name, :user_name, :email, :password, :password_confirmation)
  end
end
