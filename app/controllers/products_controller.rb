class ProductsController < ApplicationController
  def  show
    @product = Product.find(params[:id])
  end
  def  index
    @products = Product.all
  end
  def  new
    @product = Product.new
  end
  def  create
    @product = Product.new(product_values)
    @product.save
    redirect_to products_path(@product)
  end
  def edit
    @product = Product.find(params[:id])
  end
  def  update
    @product = Product.find(params[:id])
    @product.update_attributes(product_values)
    redirect_to product_path(@product.id)
  end

  def  destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def who_bought
    # byebug
    @product = Product.find(params[:id])
    @latest_order = @product.orders.order(:updated_at).last
    if stale?(@latest_order)
      respond_to do |format|
        format.atom
      end
    end
end

  def product_values
    params.require(:product).permit(:title, :description, :img_url, :price)
  end
end
