json.array!(@replies) do |reply|
  json.extract! reply, :id, :message_id, :user_id, :text, :is_approved
  json.url reply_url(reply, format: :json)
end
