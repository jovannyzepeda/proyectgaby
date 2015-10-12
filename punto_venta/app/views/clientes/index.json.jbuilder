json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nombre, :telefono, :domicilio, :correo, :categoria
  json.url cliente_url(cliente, format: :json)
end
