json.array!(@recipe_parts) do |recipe_part|
  json.extract! recipe_part, :id, :image, :description, :recipe_id
  json.url recipe_part_url(recipe_part, format: :json)
end
