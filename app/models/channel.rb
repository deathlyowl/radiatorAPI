class Channel < ActiveRecord::Base
  
  belongs_to :transmitter
  belongs_to :station
  
  def hint
    @selfName = self.name.to_ascii.downcase
    Station.all.each do |station|
      @stationName = station.name.to_ascii.downcase
      if @selfName.include?(@stationName) || @stationName.include?(@selfName)
        return station.name
      end 
    end
    return nil
  end
end