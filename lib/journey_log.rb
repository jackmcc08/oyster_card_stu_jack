class JourneyLog

  attr_reader :journey_class, :journeys, :journey

  def initialize
    @journey_class = Journey.new
    @journey = Journey.new
    @journeys = []
  end

  def start(entry_station)
    @journey = @journey_class
    @journey.start_journey(entry_station)
  end

  def finish(exit_station)
    current_journey.end_journey(exit_station)
    @journeys << @journey.store_journey
    @journey.reset_journey
  end

  def in_journey?
    !!@journey.store_journey[:entry_station]
  end

  private

  def current_journey
    in_journey? ? @journey : @journey = @journey_class
  end
end
