require 'pry-byebug'#binding.pry

class TictactoeGame
  @@token1 = 'o'
  @@token2 = 'x'
  @@winner = nil
  attr_accessor :winner

  def initialize
    @board = [*0..8]
  end
  
  def play(player, position)
    if [*0..8].include?(@board[position])
      @board[position] = get_token(player)
      return true
    else
      puts "position already played"
      return false
    end
  end

  def display_board
    system('clear')
    temp_board = @board.each_slice(3).to_a
    temp_board.each do |row|
      puts "|#{row[0]}|#{row[1]}|#{row[2]}|"
      puts "-------"
    end
  end

  def check_win
    #rows
    c1 = @board[0] == @board[1] && @board[1] == @board[2]
    c2 = @board[3] == @board[4] && @board[4] == @board[5]
    c3 = @board[6] == @board[7] && @board[7] == @board[8]
    #columns
    c4 = @board[0] == @board[3] && @board[3] == @board[6]
    c5 = @board[1] == @board[4] && @board[4] == @board[7]
    c6 = @board[2] == @board[5] && @board[5] == @board[8]
    #diagonals
    c7 = @board[0] == @board[4] && @board[4] == @board[8]
    c8 = @board[2] == @board[4] && @board[4] == @board[6]

    conditions = [c1,c2,c3,c4,c5,c6,c7,c8]

    if conditions.any?
      puts "we have a winner"
      return true
    end   
    return false
  end

  def get_token(player)
    token = player == 1 ? @@token1 : @@token2
  end
end

#game
game = TictactoeGame.new()
game.display_board
turn = 1
status = false
while status == false
  puts "It's player #{turn} turn! choose position to play"
  play = gets.chomp.to_i
  if play.between?(0,8)
    if game.play(turn, play)
      game.display_board
      status = game.check_win
      game.winner = turn if status
      turn = turn == 1 ? 2:1
    end
  else puts "not a valid move"
  end
end

puts "winner is #{game.winner}"