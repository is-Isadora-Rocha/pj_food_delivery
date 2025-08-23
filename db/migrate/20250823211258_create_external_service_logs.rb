class CreateExternalServiceLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :external_service_logs do |t|
      t.string :service
      t.string :endpoint
      t.string :method
      t.integer :status_code
      t.json :request_payload
      t.json :response_payload
      t.integer :duration_ms

      t.timestamps
    end
  end
end
