json.array!(@user_notenplans) do |user_notenplan|
  json.extract! user_notenplan, :id, :user_id, :notenplan_id
  json.url user_notenplan_url(user_notenplan, format: :json)
end
