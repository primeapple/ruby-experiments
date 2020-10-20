require 'minitest/autorun'
require_relative 'state'
require_relative 'player/min_max_player'

class TicTacToeTest < Minitest::Test

  def test_state_winner
    state = State.new({
        [0, 0] => 'o',
        [1, 0] => 'o',
        [2, 0] => 'x',
        [0, 1] => 'x',
        [1, 1] => 'x',
        [2, 1] => 'x',
        [0, 2] => 'o',
        [1, 2] => 'x',
        [2, 2] => 'o'
    })
    assert(state.filled?)
    assert_equal('x', state.winner)
  end

  def test_min_max_player
  #  Player MinMax1 makes move x=1, y=0
  #    0 1 2
  #  +-------+
  # 0|   x x |
  # 1| x o o |
  # 2|   o x |
  #  +-------+
  # MinMax2, it is your turn!
  # MinMax2 is thinking...
  # Player MinMax2 makes move x=0, y=2
  #    0 1 2
  #  +-------+
  # 0|   x x |
  # 1| x o o |
  # 2| o o x |
  #  +-------+
    state = State.new({
        [0, 0] => ' ',
        [1, 0] => 'x',
        [2, 0] => 'x',
        [0, 1] => 'x',
        [1, 1] => 'o',
        [2, 1] => 'o',
        [0, 2] => ' ',
        [1, 2] => 'o',
        [2, 2] => 'x'
    })
    p = MinMaxPlayer.new('o', 'something', 'x')
    state.print_state
    move = p.calculate_move(state)
    assert_equal([0, 0], move)
  end
end