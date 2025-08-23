json.extract! payment_intent, :id, :order_id, :provider, :amount, :status, :external_id, :payload, :created_at, :updated_at
json.url payment_intent_url(payment_intent, format: :json)
