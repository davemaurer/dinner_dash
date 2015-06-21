class Admin::OrdersController < Admin::BaseController
  def index
    if params[:status].nil?
      @orders = Order.all
      @dropdown = "Order Status"
    else
      @orders = Order.filter_by_status(params[:status])
      @dropdown = params[:status]
    end
    @statuses = ["all", "ordered", "paid", "cancelled", "completed"]
  end

  def show
    @order = Order.find(params[:id])
  end
end
