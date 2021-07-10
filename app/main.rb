# frozen_string_literal: true

require_relative './classes/grid'

def help
  help = %(
  usage: ruby main.rb <y_size> <x_size>
  use only Integers greater than 0)
  puts help
end

args = ARGV.map(&:to_i)
bad = false
args.each { |arg| bad = true if arg.class != Integer || arg.zero? }
if args.length > 2 || args.length < 2 || bad
  help
else
  args.each { |arg| puts arg }
  grid = Grid.new(args[0], args[1])
  grid.print_grid
  grid.tick
end
