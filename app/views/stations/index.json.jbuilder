json.array!(@stations) do |station|
  json.extract! station, :name, :description, :url, :genre, :shortcut, :id
end