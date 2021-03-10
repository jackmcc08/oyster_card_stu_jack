require "./lib/oystercard"

describe Oystercard do
  let(:test_card) { Oystercard.new(40) }
  let(:test_station) { double :test_station }
  let(:test_station_2) { double :test_station }

  describe "#top_up" do
    it "tops up £50 and provide confirmation" do
      expect(subject.top_up(50)).to eq "Card succesfully topped up. Balance is now £50."
    end

    it "cannot top up past the MAXIMUM LIMIT and raises an error" do
      expect{subject.top_up(100)}.to raise_error "Card max limit is £#{Oystercard::MAXIMUM_LIMIT}. Top up failed, no money added."
    end
  end

  describe "#deduct" do
    it "deducts a fare from the balance" do
      expect(test_card.send(:deduct,4)).to eq "£4 Fare deducted. New balance is £36."
    end
  end

  describe "#touch_in" do
    it "raises an error if card does not have the MINIMUM AMOUNT to travel" do
      expect{subject.touch_in(test_station)}.to raise_error "Card does not have a minimum balance of £#{Oystercard::MINIMUM_BALANCE}. Please top up."
    end

    it "charges you a penalty fare if you have not touched out previously" do
      subject.top_up(40)
      subject.touch_in(test_station_2)
      expect{subject.touch_in(test_station)}.to change{ subject.balance }.by(-Oystercard::PENALTY_FARE)
    end
  end

  describe "#touch_out" do
    it "deducts MINIMUM AMOUNT from oystercard" do
      test_card.touch_in(test_station_2)
      expect { test_card.touch_out(test_station) }.to change{ test_card.balance }.by(-Oystercard::MINIMUM_FARE)
    end

    it "charges you a penalty fare if you have not touched in previously" do
      subject.top_up(40)
      expect{ subject.touch_out(test_station) }.to change{ subject.balance }.by(-Oystercard::PENALTY_FARE)
    end
  end

  describe "#in_journey?" do
    it "returns true when card is in use on a journey" do
      test_card.touch_in(test_station)
      expect(test_card).to be_in_journey
    end

    it "returns false when card is touched out and no longer in use" do
      test_card.touch_in(test_station)
      test_card.touch_out(test_station)
      expect(test_card).not_to be_in_journey
    end
  end

  describe "#history" do
    it "checks the travel history of an oystercard after one journey" do
      test_card.touch_in(test_station)
      test_card.touch_out(test_station_2)
      expect(test_card.history).to eq [{ entry_station: test_station, exit_station: test_station_2 }]
    end
  end
end
