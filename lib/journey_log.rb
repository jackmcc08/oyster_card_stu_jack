class JourneyLog
  
  attr_reader :journey

  def initialize
    @journey = Journey.new
  end

  def start(entry_station)
    @journey.start_journey(entry_station)
  end

  private

  def current_journey
    @journey
  end
end