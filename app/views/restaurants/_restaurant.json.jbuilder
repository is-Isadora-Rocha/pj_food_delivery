json.extract! restaurant, :id, :user_id, :name, :description, :phone, :active, :opening_time, :closing_time, :min_order_value, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
