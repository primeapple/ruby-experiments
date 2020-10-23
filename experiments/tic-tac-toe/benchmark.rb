require_relative 'player/min_max_player'

class Benchmark
  def initialize(*player_classes)
    @player_classes = player_classes
  end

  def benchmark(number_of_games_each)
    win_table = {}
    @player_classes.each do |pc1|
      @player_classes.each do |pc2|
        win_table[[pc1, pc2]] = []
        number_of_games_each.times do
          player1, player2 = create_players(pc1, pc2)
          winner_class = play(player1, player2)
          win_table[[pc1, pc2]] << winner_class
        end
      end
    end
    win_table
  end

  def print_wintable(wintable)
    max = @player_classes.max { |c1, c2| c1.to_s.size <=> c2.to_s.size }.to_s.size
    puts "######### RESULTS OF BENCHMARK #########"
    print " x \\ y#{' ' * (max-4)}"
    @player_classes.each { |c| print "|#{class_name_string(c, max)}"}
    puts
    @player_classes.each do |c1|
      print "#{class_name_string(c1, max)}| "
      @player_classes.each { |c2| print(calc_win_percentage(c1, wintable[[c1, c2]])) }
      puts
    end
  end

  private

  def create_players(player_class1, player_class2)
    p1 = create_player(player_class1, 'x', 'o')
    p2 = create_player(player_class1, 'o', 'x')
    [p1, p2]
  end

  def create_player(player_class, symbol, enemy_symbol)
    if player_class == MinMaxPlayer.class
      player_class.new(symbol, player_class.to_s, enemy_symbol)
    else
      player_class.new(symbol, player_class.to_s)
    end
  end

  def play(player1, player2)
    g = Game.new(player1, player2, print: false)
    g.play.class
  end

  def class_name_string(class_name, biggest_class_name_size)
    " #{class_name.to_s}#{' ' * (biggest_class_name_size - class_name.to_s.size)} "
  end
end