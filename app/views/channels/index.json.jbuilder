json.array!(@channels) do |channel|
	!channel.transmitter ? next : ""
  	json.extract! channel, :name, :frequency, :power
	json.extract! channel.transmitter, :longitude, :latitude
end