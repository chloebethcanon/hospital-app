json.all_events do
  json.array! @all_events, partial: 'event', as: :event
end
