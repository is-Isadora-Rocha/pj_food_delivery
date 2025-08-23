json.extract! coupon, :id, :code, :discount_type, :amount, :min_order_value, :restaurant_id, :expires_at, :active, :usage_limit, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
