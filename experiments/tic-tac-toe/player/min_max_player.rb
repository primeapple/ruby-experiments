require_relative 'player'

class MinMaxPlayer < Player

  def calculate_move(state)
    _, x, y = min_max_algorithm(state, @symbol)
    [x, y]
  end

  private

  def min_max_algorithm(state, current_player_symbol)
    maximize = current_player_symbol == @symbol
    results = state.possible_moves.map do |x, y|
      next_state = state.next_state(x, y, current_player_symbol)
      r = calculate_result(next_state)
      r ||= min_max_algorithm(next_state, next_player_symbol(current_player_symbol)).first
      [r, x, y]
    end
    # Choose the best outcome:
    best_result = maximize ? results.max { |r1, r2| r1[0] <=> r2[0] } : results.min { |r1, r2| r1[0] <=> r2[0] }
    results.select { |r| r[0] == best_result[0] }.sample
  end

  def next_player_symbol(current_player_symbol)
    if current_player_symbol == @symbol
      @enemy_symbol
    else
      @symbol
    end
  end

  def calculate_result(state)
    winner = state.winner
    multiplier = state.remaining_moves + 1
    if state.filled? && winner == ' '
      0
    elsif winner == @symbol
      1 * multiplier
    elsif winner == @enemy_symbol
      -1 * multiplier
    end
  end
end