require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) {Hand.new}
  let(:card) { double("card") }
  before(:each) {hand.add_card(card)}
  describe "#add_card" do
    it "adds the given card" do
      expect(hand.current_cards).to eq([card])
    end
  end
  describe "#remove_card" do
    it "removes the given card" do
      hand.remove_card(card)
      expect(hand.current_cards).to be_empty
    end
  end

  describe "#compare_hands" do
    subject(:hand1) { Hand.new }
    subject(:hand2) { Hand.new }
    let(:card1) { double('card', value: 5, suit: "♠") }
    let(:card2) { double('card', value: 9, suit: "♥") }
    let(:card3) { double('card', value: 12, suit: "♠") }
    let(:card4) { double('card', value: 5, suit: "♠") }
    let(:card5) { double('card', value: 2, suit: "♥") }
    let(:card6) { double('card', value: 5, suit: "♠") }
    let(:card7) { double('card', value: 13, suit: "♥") }
    let(:card8) { double('card', value: 9, suit: "♠") }
    let(:card9) { double('card', value: 10, suit: "♥") }
    let(:card10) { double('card', value: 3, suit: "♠") }
    before(:each) do
      hand1.add_card(card1)
      hand1.add_card(card2)
      hand1.add_card(card3)
      hand1.add_card(card4)
      hand1.add_card(card5)
      hand2.add_card(card6)
      hand2.add_card(card7)
      hand2.add_card(card8)
      hand2.add_card(card9)
      hand2.add_card(card10)
    end
    it "returns 1 if you win" do
      expect(hand1.compare_hands(hand2)).to eq(1)
    end

    it "returns 0 if the hands tie" do
      expect(hand1.compare_hands(hand1)).to eq(0)
    end

    it "returns -1 if you lose" do
      expect(hand2.compare_hands(hand1)).to eq(-1)
    end
  end
end
