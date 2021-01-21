require "rspec"
require_relative "../app/classes/pacman.rb"

describe Pacman do
  it "Position changed" do
    grid = [[".", "."], [".", "."]]
    pacman = Pacman.new(1, 1, { y: 2, x: 2 }) 
    pacman.step(grid)
    expect(pacman.position_y).to eq 0
  end

  it "Collisioning with a wall" do
    grid = [[".", "-"], [".", "."]]
    pacman = Pacman.new(1, 1, { y: 2, x: 2 }) 
    pacman.step(grid)
    expect(pacman.position_y).to eq 1
  end
end