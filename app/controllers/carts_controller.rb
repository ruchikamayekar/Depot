class CartsController < ApplicationController
  skip_before_action :authorize, only: [:create, :update, :destroy]

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
  def  destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to(root_path) }
      format.xml { head :ok }
    end
  end
  private
  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to store_url, notice: 'Invalid cart'
  end
end
