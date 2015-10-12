json.array!(@articulos) do |articulo|
  json.extract! articulo, :id, :nombre, :descripcion, :existencia, :precio_compra, :precio_venta
  json.url articulo_url(articulo, format: :json)
end
