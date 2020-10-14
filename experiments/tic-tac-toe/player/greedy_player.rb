require_relative 'player'

class GreedyPlayer < Player

  def calculate_move(state)
    if !(wnm = winnable_next_moves(state)).empty?
      wnm.sample
    else
      random_move(state)
    end
  end

end