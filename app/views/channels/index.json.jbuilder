json.array!(@channels) do |channel|
	if !channel.transmitter
		continue
	end
  	json.extract! channel, :name, :frequency, :power
	json.extract! channel.transmitter, :longitude, :latitude
end