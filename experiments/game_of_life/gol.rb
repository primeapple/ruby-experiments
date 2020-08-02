class Game_of_Life

    def initialize(size_x, size_y, prob_cell_at_start)
        # create matrix, fill it with random start cells
        @state = Hash.new
        @size_x = size_x
        @size_y = size_y
        size_x.times do |x| 
            size_y.times do |y|
                @state[[x,y]] = rand < prob_cell_at_start
            end
        end
        @old_state = @state.clone
    end

    def start(breaktime_sec)
        time = 0
        loop do
            puts "\e[H\e[2J"
            puts "Current Time: #{time+=1}"
            print_state
            sleep(breaktime_sec)
            step
            break if @old_state == @state
        end
    end

    def print_state
        divider = '+' << ('-' * (@size_y)) << '+'
        puts divider
        @size_x.times do |x| 
            print '|'
            @size_y.times do |y|
                print @state[[x,y]] ? 'o' : ' '
            end
            puts '|'
        end
        puts divider
    end

    def step
        @old_state = @state.clone
        @old_state.each_key { |x,y| @state[[x,y]] = next_state(x,y)}
    end

    private
    def next_state(x, y)
        num_alive_neighbours = 0
        neighbour_adds = [-1, 0, 1]
        neighbour_adds.each do |x_add|
            neighbour_adds.each do |y_add| 
                if x_add == 0 && y_add == 0 
                    next
                elsif x+x_add < 0 || y+y_add < 0 || x+x_add >= @size_x || y+y_add >= @size_y
                    next
                elsif @old_state[[x+x_add, y+y_add]]
                    num_alive_neighbours += 1
                end
            end
        end
        if num_alive_neighbours < 2
            false
        elsif num_alive_neighbours > 3
            false
        elsif num_alive_neighbours == 2 && !@old_state[[x,y]]
            false
        else
            true
        end
    end
end


game = Game_of_Life.new(10, 10, 0.5)
game.start(1)