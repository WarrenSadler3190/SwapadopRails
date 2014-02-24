json.array!(@items) do |item|
  json.extract! item, :id, :title, :desc, :price, :condition, :user_id
  json.url item_url(item, format: :json)
end
