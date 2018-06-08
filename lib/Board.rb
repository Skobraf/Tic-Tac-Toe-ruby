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
