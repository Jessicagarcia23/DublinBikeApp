class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_customer!
  before_filter :ensure_admin, :only => [:edit, :destroy]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  
  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    #@order = Order.new(:myproducttype => params[:myproducttype])
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
          
  end
  #it s not saving from here
  def add
          id = params[:id]
              @order = Order.new
              @order.customer_id = current_customer.id
              @order.product_id = id
              
              @order.save
               redirect_to controller: 'order', action: 'edit', id: current_customer.id, something: 'else'
         
         
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    #Use callbacks to share common setup or constraints between actions.
   def set_order
      @order = Order.find(params[:id])
   end
  

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:email, :bike, :num, :start_date, :days, :contactNum, :customer_id, :product_id)
    end
end
