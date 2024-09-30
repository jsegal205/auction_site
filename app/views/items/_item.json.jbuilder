json.extract! item, :id, :title, :description, :start_price, :end_time, :user_id, :created_at, :updated_at
json.url item_url(item, format: :json)
