class MinMaxPlayer < Player

  def initialize(symbol, name, enemy_symbol)
    super(symbol, name)
    @enemy_symbol = enemy_symbol
  end

  def calculate_move(state)
    _, x, y = min_max_algorithm(state, @symbol)
    [x, y]
  end

  private

  def min_max_algorithm(state, current_player_symbol)
    # if we are the winner in the next state, take this
    if !(wnm = winnable_next_moves(state)).empty?
      return [current_player_symbol, wnm[0][0], wnm[0][1]]
    end
    next_symbol = next_player_symbol(current_player_symbol)
    best_outcome = [next_symbol, nil, nil]
    state.possible_moves.each do |x, y|
      next_state = state.next_state(x, y, current_player_symbol)
      if next_state.filled?
        best_outcome = choose_better_outcome(best_outcome, [next_state.winner, x, y], current_player_symbol)
      # choose the best outcome from what we have till now and what we could get from enemy turn
      else
        enemy_best_outcome = min_max_algorithm(next_state, next_symbol)
        best_outcome = choose_better_outcome(best_outcome, enemy_best_outcome, current_player_symbol)
        break if best_outcome[0] == current_player_symbol
      end
    end
    # puts "Best outcome for player #{current_player_symbol} is #{best_outcome} for state"
    # state.print_state
    best_outcome
  end

  def next_player_symbol(current_player_symbol)
    if current_player_symbol == @symbol
      @enemy_symbol
    else
      @symbol
    end
  end

  def choose_better_outcome(best_outcome_till_now, enemy_best_outcome, current_player_symbol)
    if enemy_best_outcome[0] == current_player_symbol
      enemy_best_outcome
    elsif best_outcome_till_now[0] == ' '
      best_outcome_till_now
    else
      enemy_best_outcome
    end
  end
end