class Oystercard

  attr_reader :balance, :history, :journey

  DEFAULT_BALANCE = 0
  MINIMUM_BALANCE = 1
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey = Journey.new
    @history = []
  end

  def top_up(amount)
    pot_balance = @balance + amount
    raise "Card max limit is £#{Oystercard::MAXIMUM_LIMIT}. Top up failed, no money added." if pot_balance > MAXIMUM_LIMIT
    @balance = pot_balance
    "Card succesfully topped up. Balance is now £#{@balance}."
  end

  def touch_in(station)
    deduct(PENALTY_FARE) if in_journey?
    raise "Card does not have a minimum balance of £1. Please top up." unless @balance >= MINIMUM_BALANCE
    @journey.start_journey(station)
    in_journey?
  end

  def touch_out(exit_station)
    @journey.end_journey(exit_station)
    store_journey
    in_journey? ? deduct(MINIMUM_FARE) : deduct(PENALTY_FARE)
    @journey.reset_journey
    in_journey?
  end

  def in_journey?
    @journey.in_journey?
  end


private
  def deduct(fare)
    @balance -= fare
    "£#{fare} Fare deducted. New balance is £#{@balance}."
  end

  def store_journey
    @history << @journey.store_journey
  end
end
