require_relative 'game'

game = Game.new('o', 'x')
game.make_move(1, 1)
game.make_move(0, 1)
game.make_move(2, 1)
game.make_move(1, 2)
game.make_move(0, 0)
game.make_move(2, 2)
game.make_move(1, 0)
game.make_move(0, 2)
game.make_move(2, 0)
