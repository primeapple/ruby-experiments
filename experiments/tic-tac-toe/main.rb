require_relative 'game'
require_relative 'player/random_player'
require_relative 'player/greedy_player'
require_relative 'player/manual_player'
require_relative 'player/min_max_player'

p1 = MinMaxPlayer.new('x', 'MinMax1', 'o')
# p2 = ManualPlayer.new('o', 'Toni')
p2 = MinMaxPlayer.new('o', 'MinMax2', 'x')
game = Game.new(p1, p2)
game.play