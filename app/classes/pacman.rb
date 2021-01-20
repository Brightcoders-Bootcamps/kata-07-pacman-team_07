# frozen_string_literal: true

#
#   Class used to control a Pacman
class Pacman
  attr_reader :position_x, :position_y, :rotation

  def initialize(position_x, position_y, limit, grid)
    @position_x = position_x
    @position_y = position_y
    @rotation = :up
    @limit = limit
    @grid = grid
  end

  def print_pacman
    { up: 'V ', left: '> ', right: '< ', down: '^ ' }[@rotation]
  end

  def move_left
    return false if wall?(@position_x - 1, @position_y)
    @position_x -= 1
    @position_x = 0 if @position_x.negative?
  end

  def move_right
    return false if wall?(@position_x + 1, @position_y)
    @position_x += 1
    @position_x = @limit[:x] - 1 if @position_x >= @limit[:x]
  end

  def move_down
    return false if wall?(@position_x, @position_y + 1)
    @position_y += 1
    condition = @position_y >= @limit[:y]
    @position_y = @limit[:y] - 1 if condition
  end

  def move_up
    return false if wall?(@position_x, @position_y - 1)
    @position_y -= 1
    @position_y = 0 if @position_y.negative?
  end

  def step
    move_up if @rotation == :up
    move_down if @rotation == :down
    move_right if @rotation == :right
    move_left if @rotation == :left
  end

  def wall?(position_x, position_y)
    @grid[position_y][position_x] == "|" || @grid[position_y][position_x] == "-" ? true : false
  end

  def rotate
    puts 'rotate?: '
    rotation = $stdin.gets.chomp.to_sym
    rotation = %i[up down left right].include?(rotation) ? rotation : ''
    rotation = '' if close_wall?(rotation) == true
    @rotation = rotation if rotation != ''
  end

  def close_wall?(rotation)
    right_wall = @position_x + 1 == @limit[:x] || wall?(@position_x + 1, @position_y)
    left_wall = @position_x - 1 == -1 || wall?(@position_x - 1, @position_y)
    up_wall = @position_y - 1 == -1 || wall?(@position_x, @position_y - 1)
    down_wall = @position_y + 1 == @limit[:y] || wall?(@position_x, @position_y + 1)
    { up: up_wall, down: down_wall, left: left_wall, right: right_wall }[rotation]
  end
end
