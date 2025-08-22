json.extract! address, :id, :addressable_id, :addressable_type, :cep, :street, :number, :complement, :neighborhood, :city, :state, :latitude, :longitude, :created_at, :updated_at
json.url address_url(address, format: :json)
