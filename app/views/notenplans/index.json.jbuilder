json.array!(@notenplans) do |notenplan|
  json.extract! notenplan, :id, :name, :description
  json.url notenplan_url(notenplan, format: :json)
end
