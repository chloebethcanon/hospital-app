json.messages do
  json.array! @messages, partial: 'message', as: :message
end
json.received_messages do
  json.array! @received_messages, partial: 'message', as: :message
end
json.sent_messages do
  json.array! @sent_messages, partial: 'message', as: :message
end

