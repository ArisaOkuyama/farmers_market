json.extract! product, :id, :name, :description, :price, :state, :stock, :created_at, :updated_at
json.url product_url(product, format: :json)
