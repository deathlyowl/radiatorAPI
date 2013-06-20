json.array!(@transmitters) do |transmitter|
  json.extract! transmitter, :object, :city, :place, :latitude, :longitude
  json.url transmitter_url(transmitter, format: :json)
end