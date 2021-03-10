require 'station'

describe Station do
  it "has a name" do
    expect(subject.name).to be_a(String)
  end
  it "has a zone attribute" do
    expect(subject.zone).to be_a(Integer)
  end
end