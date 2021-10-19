class Oystercard

  attr_reader :balance , :entry_station, :journeys

  DEFAULT_VALUE = 0
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
    @journeys = []
  end 

  def top_up(credit)
    fail "Maximum limit" + MAXIMUM_LIMIT.to_s + "exceeded" if @balance >= MAXIMUM_LIMIT
    @balance += credit 
  end 

  def in_journey?
    @entry_station != nil 
  end

  def touch_in(entry_station)
    fail "You have insufficient funds"  if @balance < MINIMUM_FARE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE) 
    @journeys << {entry: @entry_station, exit: exit_station}
    @entry_station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end 

end 