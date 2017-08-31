# Board represents a board to be used for a game of 3 by 3
# Tic Tac Toe.  You can place pieces, get the board, as well 
# as remember the winner.
class Board

  # initializes a new empty Board	
  def initialize
		@board = [" ", " ", " ",
						  " ", " ", " ", 
              " ", " ", " "]	
		@winner = " "
		@@connections = build_slns
   end


  # takes in a location (A1/A2/A3/B1/B2/B3/C1/C2/C3)
  # and the symbol to be placed.  Assumes the location is 
  # empty. If the game is over and this method is called,
  # an exception is raised.
	def place(location, move)
    if @winner == " "
			index = getIndex(location)
			place_huh = open(index)
			if place_huh  
		   @board[index] = move
       checkWin(index)			
			end
		  place_huh
    else
		  raise "No more moves can be placed because the game is over"
    end
  end

  # returns the winning symbol, nil if the game is not over
	def winner?
		@winner == " "? nil : @winner
  end 

  # returns a copy of the board
	def get_board
    Array.new(@board)
  end

	# for debugging - prints the state of the board
	def write
		index = 0
		@board.each do |slot| 
			if index % 3 == 2
				puts "[" + slot + "] "
      else 
				print "[" + slot + "] "
		  end
			index += 1
		end
	end

  private :write
  
	# checks if there are any winning 3-in-a-row's
	# returns true if so, false otherwise
	# updates who the winner is if the game has been won
  def checkWin(index)
		possible = @@connections[index]
		possible.each_value do |solution|
			if @board[solution[0]] == @board[solution[1]] &&
			    @board[solution[1]] == @board[solution[2]]
        @winner = @board[solution[0]]
			  return true
      end
    end
		return false
  end
  
	# returns a mapping of indices (A) to arrays of other indices
	# that are possible solutions //bad comment ik srry
  def build_slns
		connections = Hash.new
		connections[0] = Hash.new
		connections[0]['h'] = [0, 1, 2]
    connections[0]['d'] = [0, 4, 8]
    connections[0]['v'] = [0, 3, 6]	
    
    connections[1] = Hash.new
    connections[1]['h'] = [0, 1, 2]
		connections[1]['v'] = [1, 4, 7]

    connections[2] = Hash.new
    connections[2]['h'] = [0, 1, 2]
    connections[2]['d'] = [2, 4, 6]
    connections[2]['v'] = [2, 5, 8]
  
    connections[3] = Hash.new
    connections[3]['h'] = [3, 4, 5]
    connections[3]['v'] = [0, 3, 6]

    connections[4] = Hash.new
		connections[4]['h'] = [3, 4, 5]
    connections[4]['d1'] = [0, 4, 8]
    connections[4]['d2'] = [2, 4, 6]
    connections[4]['v'] = [1, 4, 7]
  
    connections[5] = Hash.new
		connections[5]['h'] = [3, 4, 5]
    connections[5]['v'] = [2, 5, 8]
    
		connections[6] = Hash.new
		connections[6]['h'] = [6, 7, 8]
		connections[6]['d'] = [2, 4, 6]
    connections[6]['v'] = [0, 3, 6]

		connections[7] = Hash.new
		connections[7]['h'] = [6, 7, 8]
		connections[7]['v'] = [1, 4, 7]
		
		connections[8] = Hash.new
		connections[8]['h'] = [6, 7, 8]
		connections[8]['d'] = [0, 4, 8]
		connections[8]['v'] = [2, 5, 8]

    connections
  end	

	# returns true if the index/board position is open
	def open(index)
		@board[index] == " "
  end

	# returns the index in terms of @board given a coordinate
	# ex: getIndex("A3") => 6
	def getIndex(location)
		(location[0].ord - 'A'.ord) +
	      ((location[1].to_i - 1) * 3)		
  end

end
