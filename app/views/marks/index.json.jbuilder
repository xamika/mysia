json.array!(@marks) do |mark|
  json.extract! mark, :id, :mark, :weighting, :shorttest, :notenplan_id, :subject_id
  json.url mark_url(mark, format: :json)
end
