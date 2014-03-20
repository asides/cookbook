json.array!(@measures) do |measure|
  json.extract! measure, :id, :name, :val
  json.url measure_url(measure, format: :json)
end
