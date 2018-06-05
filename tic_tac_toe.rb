class TicTacToeGame
  # Create players
  # Create Board
  # Loop the game
  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @win_condition = false
  end

  # check if one of the players is a winner
  def win?
    @board.win_conditions.each do |win_condition|
      if (win_condition & @player_1.inputs ) == win_condition
        @player_1.state = true
        return true
      end
      if (win_condition & @player_2.inputs ) == win_condition
        @player_2.state = true
        return true
      end
    end
    return false
  end

  def loop_game
    #ask player input
    #check win condition
    #update the Board
    #clear the board when full
    #return the winner
    @board.show
    while !@win_condition
      #calling the input for player_1
      position = @player_1.player_input(@player_1.inputs, @player_2.inputs)
      @board.update(position, @player_1)
      @board.show
      #check if he wins
      if win?
        @win_condition = true
        break
      end
      #if nobody win and the board is full then clear
      if @board.full?
        puts "Nobody Wins, you guys suck."
        @board.clear
        @board.show
      end
      #same process for player_2
      position = @player_2.player_input(@player_1.inputs, @player_2.inputs)
      @board.update(position, @player_2)
      @board.show
      if win?
        @win_condition = true
        break
      end
      if @board.full?
        puts "Nobody Wins, you guys suck."
        puts "Start Again!"
        @board.clear
        @board.show
      end
    end
    if @player_1.state
      puts "#{@player_1.name} WINS"
    end
    if @player_2.state
      puts "#{@player_2.name} WINS"
    end
  end
end

class Player
  attr_reader :sign, :inputs, :name
  attr_accessor :state

  # get input
  # player configuration (customization)
  def initialize(name, sign)
    @name = name
    @sign = sign
    @inputs = []
    @state = false
  end
  #Check if the players are not filling the same positions in the board
  def validateInput(value, player_1_positions, player_2_positions)
    while (player_1_positions.include?(value) || player_2_positions.include?(value) || value > 9 || value < 1 )
      puts "Pick another choice!"
      value = gets.chomp.to_i
    end
    return value
  end

  #get each player input with chomps
  def player_input(player_1_positions, player_2_positions)
    puts "It's #{@name} turn. Choose a position:"
    position = gets.chomp.to_i
    position = validateInput(position, player_1_positions, player_2_positions)
    @inputs.push( position )
    return position
  end
end
#end of player class

class Board
  attr_reader :win_conditions

  def initialize()
    # create empty board
    @board = Array.new(9)
    @win_conditions = [ [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],  [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7] ]
  end

  def clear
    # clear board
    for i in 0...@board.length do
      @board[i] = nil
    end
  end

  def show
    # print the board in console
    def mask_value(value)
      if value.nil?
        return " "
      else
        return value
      end
    end
    puts "  #{mask_value(@board[0])} | #{mask_value(@board[1])} | #{mask_value(@board[2])}"
    puts "-------------"
    puts "  #{mask_value(@board[3])} | #{mask_value(@board[4])} | #{mask_value(@board[5])}"
    puts "-------------"
    puts "  #{mask_value(@board[6])} | #{mask_value(@board[7]) } | #{mask_value(@board[8])}"
    puts ""
  end

  def full?
    @board.all? { |element| !element.nil? }
  end

  def showAvailable
    @board.each_with_index do |element, index|
      if element.nil?
        puts index
      end
    end
  end

  def update(position, player)
    @board[position - 1] = player.sign
  end
end

#testing the gmae
player1 = Player.new("Ayoub", "X")
player2 = Player.new("Jesus", "O")
board = Board.new
game = TicTacToeGame.new(player1, player2, board)
game.loop_game
