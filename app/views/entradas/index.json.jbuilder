json.array!(@entradas) do |entrada|
  json.extract! entrada, :id, :produto_id, :quantidade, :valor_compra, :data_compra
  json.url entrada_url(entrada, format: :json)
end
