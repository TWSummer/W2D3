class Deck
  attr_reader :cards

  def initialize
    suits = ["♠", "♥", "♦", "♣"]
    @cards = []
    (2..14).each do |num|
      suits.each do |suit|
        @cards << Card.new(num, suit)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def get_card
    raise "Deck is empty" if @cards.empty?
    @cards.pop
  end

end
