require_relative 'game'
# require 'benchmark'
require_relative 'benchmark'
require_relative 'player/random_player'
require_relative 'player/greedy_player'
require_relative 'player/manual_player'
require_relative 'player/min_max_player'

bench = Benchmark.new(RandomPlayer, GreedyPlayer, MinMaxPlayer)
result = bench.benchmark(5)
bench.print_game_table(result)

# rp1 = RandomPlayer.new('x', 'o')
# rp2 = RandomPlayer.new('o', 'x')
# gp1 = GreedyPlayer.new('x', 'o')
# gp2 = GreedyPlayer.new('o', 'x')
# mp1 = MinMaxPlayer.new('x', 'o')
# mp2 = MinMaxPlayer.new('o', 'x')
#
#
# n = 1
# Benchmark.bm do |x|
#   x.report('R-R') { n.times {Game.new(rp1, rp2, print: false).play } }
#   x.report('R-G') { n.times {Game.new(rp1, gp2, print: false).play } }
#   x.report('R-M') { n.times {Game.new(rp1, mp2, print: false).play } }
#   x.report('G-R') { n.times {Game.new(gp1, rp2, print: false).play } }
#   x.report('G-G') { n.times {Game.new(gp1, gp2, print: false).play } }
#   x.report('G-M') { n.times {Game.new(gp1, mp2, print: false).play } }
#   x.report('M-R') { n.times {Game.new(mp1, rp2, print: false).play } }
#   x.report('M-G') { n.times {Game.new(mp1, gp2, print: false).play } }
#   x.report('M-M') { n.times {Game.new(mp1, mp2, print: false).play } }
# end