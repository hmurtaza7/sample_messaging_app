json.array!(@messages) do |message|
  json.extract! message, :id, :ad_id, :sender_id, :receiver_id, :text, :is_approved
  json.url message_url(message, format: :json)
end
