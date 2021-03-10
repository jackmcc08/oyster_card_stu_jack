require 'journey_log'

describe JourneyLog do
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }

  it "has a variable which is of the class Journey" do
    expect(subject.journey_class).to be_a(Journey)
  end

  describe "#start" do
    it "returns entry_station" do
      expect(subject.start(entry_station)).to eq entry_station
    end
  end

  describe "#finish" do
    it "returns exit_station" do
      subject.start(entry_station)
      expect(subject.finish(exit_station)).to eq ({ entry_station: nil, exit_station: nil })
    end
  end

  describe "#journeys" do
    it "returns a list of all journeys" do
      subject.start(entry_station)
      subject.finish(exit_station)
      subject.finish(exit_station)
      expect(subject.journeys).to eq [{ entry_station: entry_station, exit_station: exit_station }, { entry_station: nil, exit_station: exit_station }]
    end
  end

  describe "#in_journey?" do
    it "returns true if entry_station is not nil" do
      subject.start(entry_station)
      expect(subject.in_journey?).to be true
    end
  end
end
