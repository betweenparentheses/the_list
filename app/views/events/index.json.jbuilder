json.array!(@events) do |event|
  json.extract! event, :id, :name, :location, :description, :date, :href, :latitude, :longitude, :time
  json.url event_url(event, format: :json)
end
