class Channel < ActiveRecord::Base
  
  belongs_to :transmitter
  belongs_to :station
  
  
  def hint
    Station.all.each do |station|
      if self.name.to_ascii.downcase.include?(station.name.to_ascii.downcase) || station.name.to_ascii.downcase.include?(self.name.to_ascii.downcase)
        return station.name
      end 
    end
    return nil
  end
end