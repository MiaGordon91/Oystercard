class Oystercard

  attr_reader :balance , :entry_station

  DEFAULT_VALUE = 0
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
    @in_journey = false
  end 

  def top_up(credit)
    fail "Maximum limit" + MAXIMUM_LIMIT.to_s + "exceeded" if @balance >= MAXIMUM_LIMIT
    @balance += credit 
  end 

  def in_journey?
    @in_journey
  end

  def touch_in(entry_station)
    fail "You have insufficient funds"  if @balance < MINIMUM_FARE
    @in_journey = true
    @entry_station = entry_station
  end

  def touch_out
    @in_journey = false
    deduct(MINIMUM_FARE)
  end

  private

  def deduct(fare)
    @balance -= fare
  end 

end 