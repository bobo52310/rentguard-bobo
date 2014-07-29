json.array!(@agents) do |agent|
  json.extract! agent, :id, :title, :contact_id
  json.url agent_url(agent, format: :json)
end
