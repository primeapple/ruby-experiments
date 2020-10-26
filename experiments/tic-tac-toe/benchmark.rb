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
    print " #{fill_up_string('p1 \\ p2', max)}"
    @player_classes.each { |c| print " | #{fill_up_string(c.to_s, max)}"}
    puts
    @player_classes.each do |c1|
      print " #{fill_up_string(c1.to_s, max)}"
      @player_classes.each { |c2| print " | #{fill_up_string(win_stats(c1, wintable[[c1, c2]]), max)}" }
      puts
    end
  end

  private

  def create_players(player_class1, player_class2)
    [player_class1.new, player_class2.new]
  end

  def play(player1, player2)
    g = Game.new(player1, player2, print: false)
    g.play.class
  end

  def fill_up_string(original_string, fill_to_size, char_to_fill: ' ')
    "#{original_string}#{char_to_fill * (fill_to_size - original_string.size)}"
  end

  def win_stats(start_player, results)
    # "w:#{results.count(start_player)}, "\
    # "d:#{results.count(nil.class)}, "\
    # "l:#{results.count { |c| c != start_player && c != nil.class}}"
    "W/LD=#{results.count(start_player)/results.count.to_f}"
  end
end