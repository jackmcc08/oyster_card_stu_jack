require 'journey'

describe Journey do

  let(:entry_station_victoria) { double(:station) }
  let(:exit_station_wimbledon) {double(:station)}

  describe "#start_journey" do
    it "updates entry_station when called" do
      expect(subject.start_journey(entry_station_victoria)).to eq entry_station_victoria
    end
  end

  describe "#end_journey" do
    it "updatess exit_station when called" do
      expect(subject.end_journey(exit_station_wimbledon)).to eq exit_station_wimbledon
    end
  end

  describe "#store_journey" do
    before do
      subject.start_journey(entry_station_victoria)
      subject.end_journey(exit_station_wimbledon)
    end

    it "returns hash of journey" do
      expect(subject.store_journey).to eq({entry_station: entry_station_victoria, exit_station: exit_station_wimbledon})
    end
  end

  describe "#reset_journey" do
    it "returns journey to nil" do
      expect(subject.reset_journey).to eq({entry_station: nil, exit_station: nil})
    end
  end
end
