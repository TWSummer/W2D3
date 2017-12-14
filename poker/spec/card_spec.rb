require "rspec"
require "card"
describe Card do

  subject(:ace) { Card.new(14, "♠")}

  describe "#initialize" do
    it "sets the card's value" do
      expect(ace.value).to eq(14)
    end

    it "sets the card's suit" do
      expect(ace.suit).to eq("♠")
    end
  end

  describe "#to_s" do
    it "should return the cards string" do
      expect(ace.to_s).to eq("A ♠")
    end
  end

end
