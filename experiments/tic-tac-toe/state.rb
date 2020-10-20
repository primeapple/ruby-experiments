class State

  SIZE = 3

  def initialize(state = {})
    @state = state
    if state == {}
      SIZE.times do |x|
        SIZE.times do |y|
          @state[[x, y]] = ' '
        end
      end
    end
  end

  def next_state(x, y, char)
    raise ArgumentError.new('Wrong argument for x given') unless x.between?(0, 2)
    raise ArgumentError.new('Wrong argument for y given') unless y.between?(0, 2)
    raise ArgumentError.new('There was already a point at this spot') unless @state[[x, y]] == ' '
    # TODO: maybe find a more efficient way to do this...
    hash = Marshal.load(Marshal.dump(@state))
    hash[[x, y]] = char
    State.new(hash)
  end

  def winner
    winner = ' '
    SIZE.times do |cord|
      if all_equal(@state[[cord, 0]], @state[[cord, 1]], @state[[cord, 2]])
        winner = @state[[cord, 0]]
        break
      end
      if all_equal(@state[[0, cord]], @state[[1, cord]], @state[[2, cord]])
        winner = @state[[0, cord]]
        break
      end
    end
    if all_equal(@state[[0, 0]], @state[[1, 1]], @state[[2, 2]]) ||
       all_equal(@state[[0, 2]], @state[[1, 1]], @state[[2, 0]])
      winner = @state[[1, 1]]
    end
    winner
  end

  def filled?
    SIZE.times do |y|
      SIZE.times do |x|
        return false if @state[[x, y]] == ' '
      end
    end
    true
  end

  def print_state
    divider = " +#{'--' * SIZE}-+"
    puts "   #{(0...SIZE).to_a.join(' ')}"
    puts divider
    SIZE.times do |y|
      print "#{y}| "
      SIZE.times do |x|
        print "#{@state[[x, y]]} "
      end
      puts '|'
    end
    puts divider
  end

  def possible_moves
    @state.keys.select { |key| @state[key] == ' '}
  end

  def num_empty_fields
    @state.values.count(' ')
  end

  private

  def all_equal(x, y, z)
    x == y && y == z && z != ' '
  end
end