class Oystercard

  attr_reader :balance, :journeys

  DEFAULT_VALUE = 0
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
    @journeys = []
    @our_journey = Journey.new 
  end 

  def top_up(credit)
    fail "Maximum limit" + MAXIMUM_LIMIT.to_s + "exceeded" if @balance >= MAXIMUM_LIMIT
    @balance += credit 
  end 

  def in_journey?
    @our_journey.in_journey?
    # return false if @journeys.empty?
    # (last_entry != nil) && (last_exit == nil)
  end

  def touch_in(entry_station)
    fail "You have insufficient funds"  if @balance < MINIMUM_FARE
    # Make a new journey and set the entry station
    # This makes a new instance of the journey class
    # This journey (our_journey) only has defualt stations
    @our_journey.entry_station = entry_station
    # update_entry(entry_station)
  end

  def touch_out(exit_station)
    @our_journey.exit_station = exit_station
    # deduct(@our_journey.fare)
    deduct(MINIMUM_FARE) 
    # update_exit(exit_station)
    @journeys << @our_journey.journey_hash
  end

  def last_entry
    @our_journey.journey_hash[:entry]
    # @journeys.last[:entry]
  end

  def last_exit
    @our_journey.journey_hash[:exit]
    # @journeys.last[:exit]
  end

  private

  def deduct(fare)
    @balance -= fare
  end 

  # def update_entry(entry_station)
  #   @journeys << {entry: entry_station, exit: nil}
  # end

  # def update_exit(exit_station)
  #   @journeys.last[:exit] = exit_station
  # end

end 