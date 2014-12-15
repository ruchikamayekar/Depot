class CartsController < ApplicationController
  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, notice: 'Invalid cart'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml { render xml: @cart }
      end
    end
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
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to(root_path) }
      format.xml { head :ok }
    end
  end
  # def cart_values
  #   params.require(:cart).permit(:cart_id, :title, :description, :img_url, :price)
  # end
end
