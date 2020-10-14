require_relative 'player'

class ManualPlayer < Player

  def calculate_move(state)
    puts "Hey #{@name}, please input your next move for the following state"
    state.print_state
    print "x [0, ..., #{State::SIZE - 1}] = "
    x = gets.chomp.to_i
    print "y [0, ..., #{State::SIZE - 1}] = "
    y = gets.chomp.to_i
    [x, y]
  end

end