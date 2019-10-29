json.extract! feed_ingredient, :id, :feed_id, :ingredient_id, :price, :quantity, :created_at, :updated_at
json.url feed_ingredient_url(feed_ingredient, format: :json)
