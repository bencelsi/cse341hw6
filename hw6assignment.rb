# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

#Notes on provided:
#



class MyPiece < Piece
	All_My_Pieces = [[[[0, 0], [1, 0], [0, 1], [1, 1]]],  # square (only needs one)
        #rotations([[0, 0], [-1, 0], [1, 0], [0, -1]]), # T
		#[[[0, 0], [-1, 0], [1, 0], [2, 0]], # long (only needs two)
		#[[0, 0], [0, -1], [0, 1], [0, 2]]],
        #rotations([[0, 0], [0, -1], [0, 1], [1, 1]]), # L
	    #rotations([[0, 0], [0, -1], [0, 1], [-1, 1]]), # inverted L
	    #rotations([[0, 0], [-1, 0], [0, -1], [1, -1]]), # S
	    #rotations([[0, 0], [1, 0], [0, -1], [-1, -1]]),
	    rotations([[0,0],[-1,0],[-1,1],[0,1],[1,0]])] # thumbs up

	def initialize(point_array, board)
		super(point_array, board)
	end
	
	def self.next_piece (board)
		MyPiece.new(All_My_Pieces.sample, board)
	end
	
	
end

class MyBoard < Board
	def initialize (game)
		super(game)
		@current_block = MyPiece.next_piece(self)
	end
  # your enhancements here
	def rotate_upside_down
    if !game_over? and @game.is_running?
      @current_block.move(0, 0, -2)
    end
    draw
  end
end

class MyTetris < Tetris

	def abc
		print "abc"
	end
	def initialize
		super
	end
	
	def set_board
		@canvas = TetrisCanvas.new
		@board = MyBoard.new(self)
		@canvas.place(@board.block_size * @board.num_rows + 3,
        @board.block_size * @board.num_columns + 6, 24, 80)
		@board.draw
	end
	def key_bindings
		super
		@root.bind('z', proc {self.new_game})
		
		@root.bind('u', proc {@board.rotate_upside_down}) 
		abc
	end
	
	
end


