json.extract! order, :id, :user_id, :restaurant_id, :address_id, :status, :subtotal, :delivery_fee, :total, :payment_method, :payment_status, :courier_id, :distance_meters, :eta_minutes, :route_geometry, :coupon_id, :created_at, :updated_at
json.url order_url(order, format: :json)
