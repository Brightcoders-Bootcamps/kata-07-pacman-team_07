# frozen_string_literal: true

#
# Class to control the rules of walls
class Rules
  def self.close_wall?(grid, rotation, position_x, position_y, limit)
    right_wall = position_x + 1 == limit[:x] || Rules.wall?(grid, position_x + 1, position_y)
    left_wall = position_x - 1 == -1 || Rules.wall?(grid, position_x - 1, position_y)
    up_wall = position_y - 1 == -1 || Rules.wall?(grid, position_x, position_y - 1)
    down_wall = position_y + 1 == limit[:y] || Rules.wall?(grid, position_x, position_y + 1)
    { up: up_wall, down: down_wall, left: left_wall, right: right_wall }[rotation]
  end

  def self.wall?(grid, position_x, position_y)
    return false if position_y == grid.size

    position = grid[position_y][position_x]
    ['|', '-'].include?(position) ? true : false
  end
end
