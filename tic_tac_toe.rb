#first
#create an empty array with the lenght of 97
players_array = ["","","","","","","","",""]
  #create inputs to fill the positions of the array
  player_x = []
  for i in 0...players_array do
    player_1_input = gets.chomp.to_i
    players_array[player_1_input] = 'X'
    player_x.push(player_1_input)
    if(!win_condition)
      player_2_input = gets.chomp.to_i
      players_array[player_2_input] = '0'
      player_x.push(player_2_input)
    end
  end
  player_1_input = gets.chomp.to_i
  players_array[player1_input] = 'X'
  player_x.push(player1_input)
  player_2_input = gets.chomp.to_i
  players_array[player_2_input] = '0'
  player_x.push(player_2_input)
  print players_array

# set up 8 win condition
#win conditions are :
win_conditions = [
                  [0, 1, 2],
                  [3, 4, 5],
                  [6, 7, 8],
                  [0, 3, 6],
                  [1, 4, 7],
                  [2, 5, 8],
                  [0, 4, 8],
                  [2, 4, 6]
                ]
  def win_wondition
    player_o_win = false
    player_x_win = false
    win_conditions.each do |array|
      win_condition = array.to_set
      if win_condition.subset?(player_x.to_set)
        player_x_win = true
        break
      end
      if win_condition.subset?(player_o.to_set)
        player_o_win = true
        break
      end
    end

  end

class TicTacToeGame
  # Create players
  # Create Board
  # Loop the game
  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def loop_game
    #ask player input
    #check win condition
  end

end

class Player
  # get input
  # player configuration (customization)
  def initialize(name, sign)
    @name = name
    @sign = sign
  end

  def player_input
    #get player input with chomps
  end

end

class Board
  # Available positions
  # printing board
  def initialize()
    #create empty board
  end
end
