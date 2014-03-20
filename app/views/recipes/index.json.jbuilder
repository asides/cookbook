json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :description, :image, :complexity, :cooking_time, :is_draft, :is_checked
  json.url recipe_url(recipe, format: :json)
end
