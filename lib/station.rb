class Station

  attr_accessor :name , :zone
  
  DEFAULT_STATION = nil
  DEFAULT_ZONE = 1

  def initialize
    @name = DEFAULT_STATION
    @zone = DEFAULT_ZONE
  end

end 