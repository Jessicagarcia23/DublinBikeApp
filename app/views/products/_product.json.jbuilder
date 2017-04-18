json.extract! product, :id, :type, :description, :rental_price, :created_at, :updated_at
json.url product_url(product, format: :json)