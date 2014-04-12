json.array!(@complexities) do |complexity|
  json.extract! complexity, :id, :title, :sort_order
  json.url complexity_url(complexity, format: :json)
end
