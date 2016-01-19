json.id event.id
json.title event.title
json.date event.date
json.start DateTime.new(event.date.year, event.date.month, event.date.day, event.start_time.hour, event.start_time.min)
json.end event.end_time
json.location event.location
json.description event.description
json.capacity event.capacity
json.is_private event.is_private
json.event_owner event.user.full_name
json.url "/events/#{event.id}"