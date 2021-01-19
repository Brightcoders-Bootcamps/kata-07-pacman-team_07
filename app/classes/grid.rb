require_relative "pacman"
class Grid
  def initialize(size_x, size_y)
    @size_x = 8
    @size_y = 8
    generate_grid()
  end 

  def generate_grid
    @grid = Array.new(@size_y){ Array.new(@size_x){ "." } }
    @pacman = Pacman.new(4, 4,{y: @size_y, x: @size_x})
    @grid[@pacman.position_y][@pacman.position_x] = @pacman
  end

  def print_grid
    @grid.each do |row| 
      puts ""
      row.each do |col|
        print col.is_a?(Pacman) ? col.print_pacman : col + " "
      end
    end
    puts ""
  end

  def tick
    loop do
      system("clear")
      @grid[@pacman.position_y][@pacman.position_x] = " "
      @pacman.step
      @grid[@pacman.position_y][@pacman.position_x] = @pacman
      print_grid
      @pacman.rotate
    end
  end
  
end