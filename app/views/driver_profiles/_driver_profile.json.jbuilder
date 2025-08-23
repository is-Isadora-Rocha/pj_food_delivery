json.extract! driver_profile, :id, :user_id, :vehicle_type, :plate, :active, :created_at, :updated_at
json.url driver_profile_url(driver_profile, format: :json)
