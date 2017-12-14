class Card
  attr_reader :value, :suit

  SUITS = ["♠", "♥", "♦", "♣"]
  VALUES = (2..14).to_a

  def initialize(value, suit)
    raise "Not a valid value" unless VALUES.include? value
    raise "Not a valid suit" unless SUITS.include? suit
    @value = value
    @suit = suit
  end

  def to_s
    cards = %w[2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A]
    cards[@value - 2] + " " + @suit
  end

end
