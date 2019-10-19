json.extract! purchase, :id, :unit, :price_per_unit, :date, :ingredient_id, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
