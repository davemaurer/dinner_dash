class AdminsController < ApplicationController
  def show
    redirect_to items_path unless current_admin?
  end
end
