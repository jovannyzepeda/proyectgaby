json.array!(@venta) do |ventum|
  json.extract! ventum, :id, :user_id, :cliente_id, :fecha, :total
  json.url ventum_url(ventum, format: :json)
end
