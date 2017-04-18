
class Order < ActiveRecord::Base
   
    belongs_to :Products
validate :order_date_cannot_be_in_the_past

    def order_date_cannot_be_in_the_past
        if start_date.present? && start_date < Date.today
            errors.add(:start_date,"Can not make an order in the past")
        end
    end
end 
