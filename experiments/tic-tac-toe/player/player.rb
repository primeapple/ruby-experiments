require_relative '../state'

class Player

  attr_reader :symbol, :name

  def initialize(symbol, enemy_symbol, name: self.class.to_s)
    @symbol = symbol
    @enemy_symbol = enemy_symbol
    @name = name
  end

  def calculate_move(state); end

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