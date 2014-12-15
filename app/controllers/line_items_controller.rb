class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    product = Product.find(params[:product_id]) # product is local variable here because there is no need to make this available
#to the view.
    @line_item = @cart.line_items.build(product: product)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to(@line_item.cart, notice: 'Line item was successfully created.') }
        format.xml { render xml: @line_item, status: :created, location: @line_item }
      else
        format.html { render :action => "new" }
        format.xml { render xml: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end
end
  # @ticket = Ticket.new(ticket_params)

  #   respond_to do |format|
  #     if @ticket.save
  #       format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
  #       format.json { render :show, status: :created, location: @ticket }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @ticket.errors, status: :unprocessable_entity }
  #     end
  #   end
