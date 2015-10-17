json.array!(@sells) do |sell|
  json.extract! sell, :id, :user_id, :cliente_id, :total
  json.url sell_url(sell, format: :json)
end
