#first
X AND 0
#create an empty array with the lenght of 97
players_array = ["","","","","","","","",""]
#array of index
array = [
          0, 1, 2,
          3, 4, 5,
          6, 7, 8
        ]
  #create inputs to fill the positions of the array
  player_x = []

  player_1_input = gets.chomp
  players_array[player1_input.to_i] = 'X'
  player_x.push(player1_input.to_i)
  player_2_input = gets.chomp
  players_array[player_2_input.to_i] = '0'
  player_x.push(player_2_input.to_i)
  print players_array


player_x = [3, 2, 4, 8]

player_o = [3, 5, 7]
#check for win condition
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
                  [2, 4, 6]]

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


#chek if [x,x,x] have the same index as the winning condition
