class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_name: params[:session][:user_name])
    if current_admin?
      redirect_to admin_path
    elsif user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to cart_path
      flash[:notice] = "Welcome, #{user.full_name}"
    else
      flash[:notice] = "Invalid login."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to items_path
  end
end
