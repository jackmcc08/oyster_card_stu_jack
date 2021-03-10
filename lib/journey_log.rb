class JourneyLog

  attr_reader :journey_class, :journeys

  def initialize
    @journey_class = Journey.new
    @journey = nil
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

  private

  def current_journey
    @journey.in_journey? ? @journey : @jounery = @journey_class
  end
end
