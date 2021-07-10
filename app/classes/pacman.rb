# frozen_string_literal: true

require_relative 'rules'
# frozen_string_literal: true

#
#   Class used to control a Pacman
class Pacman
  attr_reader :position_x, :position_y, :rotation

  def initialize(position_x, position_y, limit)
    @position_x = position_x
    @position_y = position_y
    @rotation = :up
    @limit = limit
  end

  def print_pacman
    { up: 'V ', left: '> ', right: '< ', down: '^ ' }[@rotation]
  end

  def move_left(grid)
    return false if Rules.wall?(grid, @position_x - 1, @position_y)

    @position_x -= 1
    @position_x = 0 if @position_x.negative?
  end

  def move_right(grid)
    return false if Rules.wall?(grid, @position_x + 1, @position_y)

    @position_x += 1
    @position_x = @limit[:x] - 1 if @position_x >= @limit[:x]
  end

  def move_down(grid)
    return false if Rules.wall?(grid, @position_x, @position_y + 1)

    @position_y += 1
    condition = @position_y >= @limit[:y]
    @position_y = @limit[:y] - 1 if condition
  end

  def move_up(grid)
    return false if Rules.wall?(grid, @position_x, @position_y - 1)

    @position_y -= 1
    @position_y = 0 if @position_y.negative?
  end

  def step(grid)
    move_up(grid) if @rotation == :up
    move_down(grid) if @rotation == :down
    move_right(grid) if @rotation == :right
    move_left(grid) if @rotation == :left
  end

  def rotate(grid)
    puts 'rotate?: '
    rotation = $stdin.gets.chomp.to_sym
    rotation = %i[up down left right].include?(rotation) ? rotation : ''
    rotation = '' if Rules.close_wall?(grid, rotation, @position_x, @position_y, @limit) == true
    @rotation = rotation if rotation != ''
  end
end
