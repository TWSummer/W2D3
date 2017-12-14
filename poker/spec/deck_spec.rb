require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) {Deck.new}

  describe "#initialize" do
    it "contains all cards" do
      expect(deck.cards.all? { |card| card.is_a?(Card) } ).to be true
    end

    it "sets its deck to 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "makes the right values" do
      values = (2..14).to_a * 4
      card_values = []
      deck.cards.each do |card|
        card_values << card.value
      end
      expect(card_values.sort).to eq(values.sort)
    end

    it "makes the right suits" do
      suits = ["♠", "♥", "♦", "♣"] * 13
      card_suits = []
      deck.cards.each do |card|
        card_suits << card.suit
      end
      expect(card_suits.sort).to eq(suits.sort)
    end

  end

  describe "#shuffle" do

    it "changes the order" do
      unshuffled_deck = deck.cards.dup
      deck.shuffle
      expect(deck.cards).to_not eq(unshuffled_deck)
    end

    it "contains the same cards" do
      unshuffled_deck = deck.cards.dup
      deck.shuffle
      expect(deck.cards.all? {|card| unshuffled_deck.include? (card)}).to be true
    end

  end

  describe "#get_card" do

    it "should return a single card" do
      expect(deck.get_card.is_a?(Card)).to be true
    end

    it "should remove the card from the deck" do
      card = deck.get_card
      expect(deck.cards.include?(card)).to be false
    end

  end

end
