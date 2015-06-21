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
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "You have successfully updated order number #{@order.id}'s status"
      redirect_to admin_orders_path
    else
      flash[:errors] = "Sorry, unable to update the status"
      redirect_to admin_orders_path
    end
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end
end
