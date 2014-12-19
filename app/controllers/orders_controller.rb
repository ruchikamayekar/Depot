class OrdersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to root_path, notice: "Your cart is empty"
      return
    end
    @order = Order.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render xml: @order }
    end
  end
  def create
    # byebug
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(current_cart)
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        # debugger
        OrderNotifier.received(@order).deliver #step 2: when to send the mail
        format.html { redirect_to(root_path, notice: I18n.t(:thanks)) }
        format.xml { render xml: @order, status: :created, location: @order }
      else
        format.html { render action: :new }
        format.xml { render xml: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type)
  end
end
