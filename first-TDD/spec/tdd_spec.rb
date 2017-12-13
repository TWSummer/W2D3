require 'rspec'
require 'tdd'

describe "#my_uniq" do
  it "only returns the unique elements" do
    expect([1,1,5,4,5,6].my_uniq.sort).to eq([1,5,4,6].sort)
  end

  it "doesn't change the ordering of elements" do
    expect([1,1,5,4,5,6].my_uniq).to eq([1,5,4,6])
  end

  it "doesn't change an array without duplicates" do
    expect([1,7,5,2].my_uniq).to eq([1,7,5,2])
  end
end

describe "#two_sum" do
  it "finds pairs of zero summing elements" do
    expect([-1, 0, 2, -2, 1, 8].two_sum.sort).to eq([[0,4], [2,3]])
  end

  it "returns in the pairs in order" do
    expect([-1, 0, 2, -2, 1, 8].two_sum).to eq([[0,4], [2,3]])
  end

  it "return an empty array if no zero sum pairs are found" do
    expect([5, 3, 2, 19, 1, -83].two_sum.sort).to eq([])
  end
end

describe "#my_transpose" do
  subject(:grid) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}
  let(:result) {[
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]}
  subject(:uneven) {[
    [0, 1],
    [3, 4],
    [6, 7]
  ]}

  it "transposes an array" do
    expect(grid.my_transpose).to eq(result)
  end

  it "raises an error if the array isnt symetical" do
    expect { uneven.my_transpose }.to raise_error("Not symmetrical")
  end

end

describe "#stock_picker" do

  it "returns the most profitable pair of days" do
    expect(stock_picker([100,101,99,100,106,80,82])).to eq([3,4])
  end
  it "should raise an error if there is less than two days" do
    expect{stock_picker([1])}.to raise_error("Not enough data")
  end

end


describe TowersOfHanoi do
  subject(:game) {TowersOfHanoi.new}
  describe "#move" do
    before(:each) { game.move([0, 2]) }
    it "places piece in new locaton" do
      expect(game.board.last).to eq([1])
    end
    it "removes piece from old location" do
      expect(game.board.first).to eq([3, 2])
    end
  end

  describe "#won?" do

    it "returns true if board is in winning state" do
      game.board = [[],[],[3,2,1]]
      expect(game.won?).to be true
    end

    it "returns false if the board is not in a winning state" do
      expect(game.won?).to be false
    end
  end
end
