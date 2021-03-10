class Journey

  def initialize
    @journey = { entry_station: nil, exit_station: nil }
  end

  def start_journey(entry_station)
    @journey[:entry_station] = entry_station
  end

  def end_journey(exit_station)
    @journey[:exit_station] = exit_station
  end

  def store_journey
    @journey
  end

  def reset_journey
    @journey = { entry_station: nil, exit_station: nil }
  end
end
