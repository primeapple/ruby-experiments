require_relative 'player'

class RandomPlayer < Player

  def calculate_move(state)
    random_move(state)
  end

end