json.array!(@contacts) do |contact|
  json.extract! contact, :id, :email, :agent_id
  json.url contact_url(contact, format: :json)
end
