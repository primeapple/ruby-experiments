require_relative 'game'
require_relative 'player'

p1 = Player.new('o', 'Peter')
p2 = Player.new('x', 'Hans')

game = Game.new(p1, p2)
game.make_move(1, 1)
game.make_move(0, 1)
game.make_move(2, 1)
game.make_move(1, 2)
game.make_move(0, 0)
game.make_move(2, 2)
game.make_move(1, 0)
game.make_move(0, 2)
game.make_move(2, 0)
