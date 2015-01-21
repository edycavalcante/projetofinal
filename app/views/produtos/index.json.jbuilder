json.array!(@produtos) do |produto|
  json.extract! produto, :id, :nome, :valor_venda, :tipo_id
  json.url produto_url(produto, format: :json)
end
