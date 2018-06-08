class TicTacToeGame
  require 'colorize'
  attr_accessor :player_1, :player_2, :board, :win_condition
  # Create players
  # Create Board
  # Loop the game
  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @win_condition = false
    @flag = true
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

  def players_clear
    @player_1.clear
    @player_2.clear
  end

  def player_input(player, position)
    player.inputs.push( position )
    return position
  end

  def validate_input(value)
    if (@player_1.inputs.include?(value) || @player_2.inputs.include?(value) || value > 9 || value < 1 )
      return false
    end
    return true
  end

  def toggle_player
    if @flag == true
      @flag = false
      return @player_1
    else
      @flag = true
      return @player_2
    end
  end

  def winner
    if @player_1.state
      puts "#{@player_1.name} WINS".yellow
    end
    if @player_2.state
      puts "#{@player_2.name} WINS".yellow
    end
  end

end

class Player
  attr_reader :sign, :name
  attr_accessor :state, :inputs

  # get input
  # player configuration (customization)
  def initialize(name, sign)
    @name = name
    @sign = sign
    @inputs = []
    @state = false
  end

  def clear
    @inputs = []
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
    system("cls")
    puts "\n\n"
    puts "  #{mask_value(@board[0])} | #{mask_value(@board[1])} | #{mask_value(@board[2])}"
    puts "-------------"
    puts "  #{mask_value(@board[3])} | #{mask_value(@board[4])} | #{mask_value(@board[5])}"
    puts "-------------"
    puts "  #{mask_value(@board[6])} | #{mask_value(@board[7]) } | #{mask_value(@board[8])}"
    puts "\n\n"
  end

  def full?
    @board.all? { |element| !element.nil? }
  end

  def show_available
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

#testing the g
