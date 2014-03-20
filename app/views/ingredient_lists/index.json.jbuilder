json.array!(@ingredient_lists) do |ingredient_list|
  json.extract! ingredient_list, :id, :name, :ingredient_item_id, :recipe_id
  json.url ingredient_list_url(ingredient_list, format: :json)
end
