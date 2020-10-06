require_relative 'state'
require_relative 'player'

class Game

  def initialize(player1, player2)
    @state = State.new
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    puts "#{@player1.name} plays with #{player1.symbol}"
    puts "#{@player2.name} plays with #{player2.symbol}"
    puts "#{@current_player.name} is starting!"
  end

  def make_move(x, y)
    return unless @winner.nil?
    return if @state.filled?

    @state = @state.next_state(x, y, @current_player.symbol)
    @state.print_state
    win = @state.win?
    if win
      @winner = @current_player
      puts "#{@winner.name} wins!"
    else
      change_current_player
      puts "#{@current_player.name}, it is your turn!"
    end
  end

  private

  def change_current_player
    @current_player = if @current_player == @player1
                        @player2
                      else
                        @player1
                      end
  end

end
