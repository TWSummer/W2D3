class Hand
  attr_reader :current_cards

  def initialize
    @current_cards = []
  end

  def add_card(card)
    @current_cards.push(card)
  end

  def remove_card(card)
    @current_cards.delete(card)
  end

  def compare_hands(other_hand)
    their_values = build_value_array(other_hand)
    my_values = build_value_array(self)
    compare_values(my_values, their_values)
  end

  private

  def compare_values(my_vals, their_vals)
    my_vals.each_with_index do |el, idx|
      comparison = my_vals[idx] <=> their_vals[idx]
      return comparison unless comparison == 0
    end
    0
  end

  def build_value_array(hand)
    [one_pair(hand),
      high_card(hand)]
  end

  def straight_flush(hand)
  end

  def four_of_a_kind(hand)
  end

  def full_house(hand)
  end

  def flush(hand)
  end

  def straight(hand)
  end

  def three_of_a_kind(hand)
  end

  def two_pair(hand)
  end

  def one_pair(hand)
    vals = get_array_of_values(hand)
    return 0 if vals.uniq.count == vals.count
    high_pair = 0
    vals.each do |elm|
       high_pair = elm if vals.count(elm) > 1
    end
    points_value = 0
    vals.delete(high_pair)
    vals.each_with_index do |val, idx|
      points_value += val * 13**idx
    end
    high_pair * 13 ** 4 + points_value
  end

  def high_card(hand)
    points_value = 0
    get_array_of_values(hand).each_with_index do |val, idx|
      points_value += val * 13**idx
    end
    points_value
  end

  def get_array_of_values(hand)
    values = []
    hand.current_cards.each do |card|
      values << card.value
    end
    values.sort
  end

end
