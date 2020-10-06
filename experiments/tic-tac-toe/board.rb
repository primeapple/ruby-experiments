class Board

  SIZE = 3

  def initialize
    @board = {}
    SIZE.times do |x|
      SIZE.times do |y|
        @board[[x, y]] = ' '
      end
    end
  end

  def set(x, y, char)
    raise ArgumentError.new('Wrong argument for x given') unless x.between?(0, 2)
    raise ArgumentError.new('Wrong argument for y given') unless y.between?(0, 2)
    raise ArgumentError.new('There was already an point at this spot') unless @board[[x, y]] == ' '
    @board[[x, y]] = char
    self
  end

  def win_condition
    winner = nil
    SIZE.times do |cord|
      if all_equal(@board[[cord, 0]], @board[[cord, 1]], @board[[cord, 2]])
        winner = @board[[cord, 0]]
        break
      end
      if all_equal(@board[[0, cord]], @board[[1, cord]], @board[[2, cord]])
        winner = @board[[0, cord]]
        break
      end
    end
    if all_equal(@board[[0, 0]], @board[[1, 1]], @board[[2, 2]]) ||
       all_equal(@board[[0, 2]], @board[[1, 1]], @board[[2, 0]])
      winner = @board[[1, 1]]
    end
    winner
  end

  def filled?
    SIZE.times do |y|
      SIZE.times do |x|
        return false if @board[[x, y]] == ' '
      end
    end
    true
  end

  def print_board
    divider = '+' << ('-' * SIZE) << '+'
    puts divider
    SIZE.times do |y|
      print '|'
      SIZE.times do |x|
        print @board[[x, y]]
      end
      puts '|'
    end
    puts divider
  end

  private

  def all_equal(x, y, z)
    x == y && y == z && z != ' '
  end
end