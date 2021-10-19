class Oystercard

  attr_reader :balance, :journeys

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
    return false if @journeys.empty?
    (last_entry != nil) && (last_exit == nil)
  end

  def touch_in(entry_station)
    fail "You have insufficient funds"  if @balance < MINIMUM_FARE
    update_entry(entry_station)
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE) 
    update_exit(exit_station)
  end

  def last_entry
    @journeys.last[:entry]
  end

  def last_exit
    @journeys.last[:exit]
  end

  private

  def deduct(fare)
    @balance -= fare
  end 

  def update_entry(entry_station)
    @journeys << {entry: entry_station, exit: nil}
  end

  def update_exit(exit_station)
    @journeys.last[:exit] = exit_station
  end

end 