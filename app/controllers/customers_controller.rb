class CustomersController < ApplicationController

def findcustomer
Customer.find_by_sql(["SELECT customer_id FROM profiles WHERE customer_id = ?", current_customer.id])
end

    

  def show
    @Customer = Customer.find(params[:id])
  end
  
  def new
    @Customer = Customer.new
  end
  
  def index
    @Customer = Customer.all
  end

def destroy 
  admin = Admin.find(params[:id])
  begin 
    admin.destroy
    redirect_to admins_path, notice: 'Admin destroyed.'
  rescue => e 
    redirect_to admins_path, alert: e.message 
  end
end

  def create
    @Customer = Customer.new(Customer_params)
    if @Customer.save
      log_in @Customer
      flash[:success] = "Welcome to Rent A Bike in Dublin"
      redirect_to @Customer
    else
      render 'new'
    end
  end
  
  private
  
    def Customer_params
      params.require(:Customer).permit(:email, :password, :password_confirmation)
    end
end



