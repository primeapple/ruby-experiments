require_relative '../state'

class Player

  attr_reader :symbol, :name

  def initialize(name: self.class.to_s, symbol: 'x')
    @symbol = symbol
    @name = name
  end

  def calculate_move(state)
  end

  private

  # def possible_next_states(state)
  #   state.possible_moves.map { |x, y| state.next_state(x, y, @symbol) }
  # end

  def winnable_next_moves(state)
    state.possible_moves.select { |x, y| state.next_state(x, y, @symbol).winner == @symbol }
  end

  def random_move(state)
    state.possible_moves.sample
  end

end