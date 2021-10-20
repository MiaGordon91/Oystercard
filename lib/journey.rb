require 'station'

class Journey
# DEFAULT_ENTRY = 'Waterloo'

DEFAULT_ENTRY = Station.new
DEFAULT_EXIT = Station.new

attr_accessor :entry_station, :exit_station

def initialize
  @entry_station = DEFAULT_ENTRY
  @exit_station = DEFAULT_EXIT
end
def journey_hash 
  {entry: @entry_station, exit: @exit_station}
end

# are we in a journey?

def in_journey?
  (@entry_station.name != nil && @exit_station.name == nil)

end


# calculate fare

end
