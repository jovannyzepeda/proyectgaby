json.array!(@details) do |detail|
  json.extract! detail, :id, :sell_id, :articulo_id, :catidad
  json.url detail_url(detail, format: :json)
end
