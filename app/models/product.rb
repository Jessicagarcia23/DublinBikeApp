class Product < ActiveRecord::Base
    def self.search(search)
        where("product_type LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
    end

    
end
