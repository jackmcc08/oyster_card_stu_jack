class Oystercard

  attr_reader :balance, :history, :journey

  DEFAULT_BALANCE = 0
  MINIMUM_BALANCE = 1
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise "Card max limit is £#{Oystercard::MAXIMUM_LIMIT}. Top up failed, no money added." if @balance + amount > MAXIMUM_LIMIT
    @balance += amount
    "Card succesfully topped up. Balance is now £#{@balance}."
  end

  def touch_in(station)
    deduct(PENALTY_FARE) if in_journey?
    raise "Card does not have a minimum balance of £1. Please top up." unless @balance >= MINIMUM_BALANCE
    @journey_log.start(station)
  end

  def touch_out(exit_station)
    in_journey? ? deduct(MINIMUM_FARE) : deduct(PENALTY_FARE)
    end_journey(exit_station)
  end

  def in_journey?
    @journey_log.in_journey?
  end

private
  def deduct(fare)
    @balance -= fare
    "£#{fare} Fare deducted. New balance is £#{@balance}."
  end

  def end_journey(exit_station)
    @journey_log.finish(exit_station)
  end
end
