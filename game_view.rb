# a script for running text-based game of 
# Tic-Tac-Toe. Assumes valid input - otherwise
# behavior is undefined. 

require_relative 'board'

puts "Welcome to the game of tic-tac-toe!"
puts 

x_turn = true
b = Board.new
winner = b.winner?

# prints the board to the console
def display(board)
  puts "   A   B   C"
	index = 0
  print "1 "
  board.each do |slot|
    if index % 3 == 2
      puts "[" + slot + "] "
      if index < 8
				print ((index + 1) / 3 + 1).to_s + " "
			end
		else
      print "[" + slot + "] "
    end
    index += 1
	end
  puts
end

turn = 0
while winner.nil? && turn < 9
  display b.get_board
  symbol = x_turn ? "X" : "O"
	puts "It's #{symbol}'s turn."
  print "Please specify a valid move (A1 - C3) " 
  move = gets.chomp
  b.place(move, symbol)

	#update state for next round
	x_turn = !x_turn
	winner = b.winner?
  turn += 1
  puts 
end

display b.get_board
puts
puts "The winner is " + (turn == 9 ? "nobody!" : winner)

