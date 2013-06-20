json.array!(@channels) do |channel|
  	json.extract! channel, :name, :frequency, :power
	json.extract! channel.transmitter, :longitude, :latitude
end