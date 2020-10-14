require_relative 'game'
require_relative 'player/random_player'
require_relative 'player/greedy_player'
require_relative 'player/manual_player'

p1 = ManualPlayer.new('o', 'Toni')
p2 = GreedyPlayer.new('x', 'Greedy')

game = Game.new(p1, p2)
game.play
# game.make_move(1, 1)
# game.make_move(0, 1)
# game.make_move(2, 1)
# game.make_move(1, 2)
# game.make_move(0, 0)
# game.make_move(2, 2)
# game.make_move(1, 0)
# game.make_move(0, 2)
# game.make_move(2, 0)
