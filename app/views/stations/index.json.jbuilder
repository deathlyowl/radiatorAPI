json.array!(@stations) do |station|
  json.extract! station, :name, :description, :url, :genre, :shortcut
  json.url station_url(station, format: :json)
end