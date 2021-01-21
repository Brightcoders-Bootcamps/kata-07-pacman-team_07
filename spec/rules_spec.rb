require "rspec"
require_relative "../app/classes/rules.rb"

describe Rules do
  it "close_wall" do 
    grid = [[".", ".", "-"], [".", ".", "|"]]
    expect(Rules.close_wall?(grid, :up, 2, 0, {x: 3, y: 2})).to eq true
  end
  it "Outside of edge" do 
    grid = [[".", ".", "-"], [".", ".", "|"]]
    expect(Rules.close_wall?(grid, :up, 3, 0, {x: 3, y: 2})).to eq true
  end
end