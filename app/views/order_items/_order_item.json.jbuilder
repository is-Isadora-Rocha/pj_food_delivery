json.extract! order_item, :id, :order_id, :menu_item_id, :quantity, :unit_price, :total_price, :notes, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
