json.array!(@products) do |product|
  json.extract! product, :id, :productname, :desc
  json.url product_url(product, format: :json)
end
