json.extract! menu_item, :id, :restaurant_id, :category_id, :name, :description, :price, :available, :image_url, :created_at, :updated_at
json.url menu_item_url(menu_item, format: :json)
