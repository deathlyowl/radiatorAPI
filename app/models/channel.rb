class Channel < ActiveRecord::Base
  belongs_to :transmitter
  belongs_to :station
end