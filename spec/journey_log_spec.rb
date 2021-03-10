require 'journey_log'

describe JourneyLog do
  let(:station) { double(:station) }

  it "has a variable which is of the class Journey" do
    expect(subject.journey).to be_a(Journey)
  end

  describe "#start" do
    it "returns entry_station" do
      expect(subject.start(station)).to eq station
    end
  end
end