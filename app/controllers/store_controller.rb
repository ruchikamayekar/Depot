class StoreController < ApplicationController
  skip_before_action :authorize

  def increment_count
    session[:counter] ||= 0
    session[:counter] += 1
  end

  def index
    # debugger
    @products = Product.all
    @count = increment_count
    @cart = current_cart
  end
end
