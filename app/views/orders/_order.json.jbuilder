json.extract! order, :id, :customer_id, :product_id, :total_price, :email, :start_date, :days, :created_at, :updated_at
json.url order_url(order, format: :json)