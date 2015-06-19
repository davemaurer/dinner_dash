class AdminsController < ApplicationController
  def show
    if current_admin?

    else
      redirect_to items_path
    end
  end
end
