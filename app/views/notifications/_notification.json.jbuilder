json.extract! notification, :id, :user_id, :title, :body, :read_at, :notifiable_id, :notifiable_type, :created_at, :updated_at
json.url notification_url(notification, format: :json)
