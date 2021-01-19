class Pacman 
  attr_accessor :position_x, :position_y, :rotation
  def initialize(position_x, position_y,limit)
    @position_x = position_x
    @position_y = position_y
    @rotation = :up
    @limit = limit
  end

  def print_pacman
    case @rotation
    when :up
      return "V "
    when :left
      return "> "
    when :right
      return "< "
    when :down
      return "^ "
    end

  end

  def move_left
    @position_x -= 1
    @position_x = 0 if @position_x < 0
  end

  def move_right
    @position_x += 1 
    @position_x = @limit[:x] - 1 if @position_x >= @limit[:x] 
  end

  def move_down
    @position_y += 1

    @position_y = @limit[:y] - 1 if @position_y >= @limit[:y] 
  end

  def move_up
    @position_y -= 1
    @position_y = 0 if @position_y < 0
  end

  def step
    move_up if @rotation == :up
    move_down if @rotation == :down
    move_right if @rotation == :right
    move_left if @rotation == :left
  end

  def rotate
    puts "rotate?: "
    rotation = gets.chomp.to_sym
    rotation = [:up, :down, :left, :right].include?(rotation) ? rotation : ""
    @rotation = rotation if rotation != ""
  end
end