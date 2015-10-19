json.array!(@scoots) do |scoot|
  json.extract! scoot, :id, :subject, :body, :leave_from, :leave_to
  json.url scoot_url(scoot, format: :json)
end
