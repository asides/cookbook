json.array!(@complexities) do |complexity|
  json.extract! complexity, :id, :title, :order
  json.url complexity_url(complexity, format: :json)
end
