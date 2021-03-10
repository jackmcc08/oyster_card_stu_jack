require 'journey'

describe Journey do
  it "has a variable to store entry_station" do
    expect(subject.entry_station).to eq nil
  end
  it "has a variable to store exit_station" do
    expect(subject.exit_station).to eq nil
  end
end