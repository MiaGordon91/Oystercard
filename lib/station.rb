class Station

  attr_reader :name , :zone
  
  DEFAULT_STATION = 'Waterloo'
  DEFAULT_ZONE = 1

  def initialize
    @name = DEFAULT_STATION
    @zone = DEFAULT_ZONE
  end

end 