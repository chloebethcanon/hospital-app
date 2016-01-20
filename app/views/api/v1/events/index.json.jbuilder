json.all_events do
  json.array! @all_events, partial: 'event', as: :event
end
json.registered_events do
  json.array! @registered_events, partial: 'event', as: :event
end
json.unregistered_events do
  json.array! @unregistered_events, partial: 'event', as: :event
end
json.owned_events do
  json.array! @owned_events, partial: 'event', as: :event
end
