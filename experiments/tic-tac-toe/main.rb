require_relative 'game'
require_relative 'benchmark'
require_relative 'player/random_player'
require_relative 'player/greedy_player'
require_relative 'player/manual_player'
require_relative 'player/min_max_player'

bench = Benchmark.new(RandomPlayer, GreedyPlayer, MinMaxPlayer)
result = bench.benchmark(5)
bench.print_wintable(result)