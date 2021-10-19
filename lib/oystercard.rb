class Oystercard

  attr_reader :balance

  DEFAULT_VALUE = 0
  MAXIMUM_LIMIT = 90

  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
    @in_journey = false
  end 

  def top_up(credit)
    fail "Maximum limit" + MAXIMUM_LIMIT.to_s + "exceeded" if @balance >= MAXIMUM_LIMIT
    @balance += credit 
  end 

  def deduct(fare)
    @balance -= fare
  end 

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end 