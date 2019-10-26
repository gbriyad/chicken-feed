json.extract! feed, :id, :date, :total_chickens, :feed_quantity_per_chicken, :batch_id, :created_at, :updated_at
json.url feed_url(feed, format: :json)
