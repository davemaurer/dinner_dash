class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_name: params[:session][:user_name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to items_path
    else
      flash.now[:errors] = "Invalid login."
      render :new
    end
  end
end
