json.array!(@cooking_times) do |cooking_time|
  json.extract! cooking_time, :id, :title, :sort_order
  json.url cooking_time_url(cooking_time, format: :json)
end
