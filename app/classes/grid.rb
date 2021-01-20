# frozen_string_literal: true

require_relative 'pacman'
# frozen_string_literal: true

#
#   Class used to control the game
class Grid
  def initialize(size_y, size_x)
    @size_x = size_x
    @size_y = size_y
    generate_grid
  end

  def generate_grid
    @grid = Array.new(@size_y) { Array.new(@size_x) { '.' } }
    @pacman = Pacman.new(@size_y / 2, @size_x / 2, { y: @size_y, x: @size_x })
    @grid[@pacman.position_y][@pacman.position_x] = @pacman
  end

  def print_grid
    @grid.each do |row|
      puts ''
      row.each { |col|print col.is_a?(Pacman) ? col.print_pacman : "#{col} "}
    end
    puts ''
  end

  def tick
    loop do
      system('clear')
      reubicate_pacman()
    end
  end

  def reubicate_pacman
    @grid[@pacman.position_y][@pacman.position_x] = ' '
    @pacman.step
    @grid[@pacman.position_y][@pacman.position_x] = @pacman
    @pacman.rotate
    print_grid
  end
end
