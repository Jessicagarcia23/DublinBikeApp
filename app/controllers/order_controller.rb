class OrderController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
     @order = Order.find(params[:id])
  end
  def add
          id = params[:id]
              @order = Order.new
              @order.customer_id = current_customer.id
              @order.product_id = id
              
              @order.save
            @post = Order.order("created_at").last
             redirect_to controller: 'orders', action: 'edit', id: @post.id, something: 'else'
         
  end

end
