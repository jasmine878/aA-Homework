class Board
  attr_accessor :cups

  def initialize(name1, name2)
    #whenever we have a parameter we want to read we have to initialize it
    @name1 = name1
    @name2 = name2
    #we see in the game file the names are the parameters when we create a New board
    @cups = Array.new(14) { Array.new }
    place_stones
    #creating a board of 14 cups empty arrays

    # paste 'Array.new(14) { Array.new }' in pry to see an image
    # [[], [], [], [], [], [], [], [], [], [], [], [], [], []]
  
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times do
        cup << :stone
        #symbol stone can be a banana.  it's just a variable here
        #the specs say to put :stone in the cup
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    
    stones = @cups[start_pos] #gives the array filled with stones
    @cups[start_pos] = []     #empties cup

    #distributes stones
    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      #places stones in the correct player's cups
      #this loops around the board once you reach the end
      if cup_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop
      end
    end

    render 
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      # ended on store -- get to choose where to start again
      :prompt
      #symbol prompt stores truthy values.  it gives the return of the helper method
      #is assigned in macala class.  need to look at the other file
    elsif @cups[ending_cup_idx].count == 1
      :switch
      #we switch after we drop a stone into an empty cup which results in count of 1
    else
    ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups.take(6).all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    if player1_count == player2_count
      :draw
    else
      player1_count > player2_count ? @name1 : @name2
    end
  end
end

