class Array

  def my_uniq
    sorted_arr = []
    self.each do |elm|
      sorted_arr << elm unless sorted_arr.include? elm
    end
    sorted_arr
  end

  def two_sum
    zero_sum_pairs = []
    i = 0
    while i < count - 1
      j = i + 1
      while j < count
        zero_sum_pairs << [i, j] if self[i] == -self[j]
        j += 1
      end
      i += 1
    end
    zero_sum_pairs
  end

  def my_transpose
    self.each do |row|
      raise "Not symmetrical" if !row.is_a?(Array) || row.length != count
    end
    flipped_array = Array.new(count) { Array.new(count) }
    self.each_with_index do |row, rowidx|
      row.each_with_index do |el, colidx|
        flipped_array[colidx][rowidx] = self[rowidx][colidx]
      end
    end
    flipped_array
  end


end

def stock_picker(arr)
  raise "Not enough data" if arr.length < 2
  max_diff_so_far = 0
  max_idx = nil
  i = 0
  while i < arr.length - 1
    if (arr[i+1].to_f / arr[i]) > max_diff_so_far
      max_diff_so_far = arr[i + 1].to_f / arr[i]
      max_idx = i
    end
    i += 1
  end
  [max_idx, max_idx + 1]
end

class TowersOfHanoi
  attr_accessor :board
  def initialize
    @board = [[3,2,1],[],[]]
  end

  def run
    until won?
      render
      take_turn
    end
    puts "You won!"
  end

  def render
    p @board
  end

  def take_turn
    input = get_move
    move(input)
  end

  def get_move
    input = ""
    until valid_input?(input)
      puts "Enter a move. ex: 1,2"
      input = gets.chomp
    end
    parse(input)
  end

  def parse(input)
    input.split(",").map { |num| num.to_i - 1 }
  end

  def valid_input?(input)
    pos = input.split(",")
    return false unless pos.length == 2
    pos.map!(&:to_i)
    return false unless pos[0] > 0 && pos[0] < 4
    pos[1] > 0 && pos[1] < 4
  end

  def move(pos)
    from, to = pos
    @board[to] << @board[from].pop
  end

  def won?
    @board[1].length == 3 || @board[2].length == 3
  end
end

if __FILE__ == $PROGRAM_NAME
  TowersOfHanoi.new.run
end
