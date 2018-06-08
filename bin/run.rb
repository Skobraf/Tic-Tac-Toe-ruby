require '../lib/TicTacToeGame.rb'
require '../lib/Player.rb'
require '../lib/Board.rb'

system("cls")
puts "Welcome to the Tic Tac Toe Game"
puts "Enter first player name:"
player1_name = gets.chomp
puts "Enter second player name:"
player2_name = gets.chomp
system("cls")
player1 = Player.new(player1_name, "X".red)
player2 = Player.new(player2_name, "O".green)
board = Board.new
game = TicTacToeGame.new(player1, player2, board)
system("cls")
game.board.show

while !game.win_condition
  if game.board.full?
    puts "Nobody Wins, you guys suck."
    game.players_clear
    game.board.clear
    system("cls")
    game.board.show
  end

  player = game.toggle_player()
  puts "It's #{player.name} turn. Choose a position between 1 - 9:"
  position = gets.chomp.to_i
  until (game.validate_input(position))
    puts "Pick another choice!"
    position = gets.chomp.to_i
  end
  position = game.player_input(player, position)
  game.board.update(position, player)
  system("cls")
  game.board.show
  game.win_condition = game.win? #player.state!
end

game.winner
