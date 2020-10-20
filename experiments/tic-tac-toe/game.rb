require_relative 'state'
require_relative 'player/player'

class Game

  def initialize(player1, player2, player1_start = true)
    @state = State.new
    @player1 = player1
    @player2 = player2
    @current_player = player1_start ? @player1 : @player2
    puts "#{@player1.name} plays with #{player1.symbol}"
    puts "#{@player2.name} plays with #{player2.symbol}"
    puts "#{@current_player.name} is starting!"
  end

  def play
    until finished?
      x, y = @current_player.calculate_move(@state)
      make_move(x, y)
    end
  end

  def make_move(x, y)
    return if finished?

    puts "Player #{@current_player.name} makes move x=#{x}, y=#{y}"
    @state = @state.next_state(x, y, @current_player.symbol)
    @state.print_state
    if @state.winner != ' '
      @winner = @current_player
      puts "#{@winner.name} wins!"
    elsif @state.filled?
      puts "It's a draw!"
    else
      change_current_player
      puts "#{@current_player.name}, it is your turn!"
    end
  end

  def finished?
    @state.filled? || !@winner.nil?
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
