require_relative 'game'
require_relative 'benchmark'
require_relative 'player/random_player'
require_relative 'player/greedy_player'
require_relative 'player/manual_player'
require_relative 'player/min_max_player'

bench = Benchmark.new(RandomPlayer, GreedyPlayer)
result = bench.benchmark(5)
result.each { |k, v| puts "classes #{k}, wins #{v}"}
bench.print_wintable(result)