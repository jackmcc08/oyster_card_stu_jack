class Oystercard

  attr_reader :balance, :history, :journey

  DEFAULT_BALANCE = 0
  MINIMUM_BALANCE = 1
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    # @in_use = false
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
    raise "Card does not have a minimum balance of £1. Please top up." unless @balance >= MINIMUM_BALANCE
    @journey.start_journey(station)
    in_journey?
  end

  def touch_out(exit_station)
    store_journey(exit_station)
    deduct(MINIMUM_FARE)
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

  def store_journey(exit_station)
    @history << {entry_station: @entry_station, exit_station: exit_station}
    @entry_station = nil
  end
end
