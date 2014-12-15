class CartsController < ApplicationController
  def  show
    @cart = Cart.find(params[:id])
  end
  def  index
    @cart = Cart.all
  end
  def  new
    @cart = Cart.new
  end
  # def  create
  #   @cart = Cart.new(product_values)
  #   @cart.save
  #   redirect_to carts_path(@cart)
  # end
  # def edit
  #   @cart = Cart.find(params[:id])
  # end
  # def  update
  #   @cart = Cart.find(params[:id])
  #   @cart.update_attributes(cart_values)
  #   redirect_to cart_path(@cart.id)
  # end

  def  destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
  end
  # def cart_values
  #   params.require(:cart).permit(:cart_id, :title, :description, :img_url, :price)
  # end
end
