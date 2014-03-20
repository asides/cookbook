json.array!(@ingredient_items) do |ingredient_item|
  json.extract! ingredient_item, :id, :qty, :ingredient_id, :measure_id
  json.url ingredient_item_url(ingredient_item, format: :json)
end
