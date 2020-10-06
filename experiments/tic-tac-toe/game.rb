require_relative 'board'

class Game

  def initialize(player1, player2)
    @board = Board.new
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def make_move(x, y)
    return unless @winner.nil?
    return unless @board.filled?

    @board.set(x, y, @current_player)
    @board.print_board
    winner = @board.win_condition
    if winner.nil?
      change_current_player
      puts "#{@current_player}, it is your turn!"
    else
      @winner = winner
      puts "#{@winner} wins!"
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
