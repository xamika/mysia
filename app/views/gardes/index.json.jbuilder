json.array!(@gardes) do |garde|
  json.extract! garde, :id, :notenplan_id, :subject_id, :garde, :weighting, :shorttest
  json.url garde_url(garde, format: :json)
end
