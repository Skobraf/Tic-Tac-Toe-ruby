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
