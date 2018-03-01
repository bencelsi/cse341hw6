# University of Washington, Programming Languages, Homework 6, hw6runner.rb

class MyPiece < Piece
	All_My_Pieces = All_Pieces.push(
		rotations([[0,0],[-1,0],[-1,1],[0,1],[1,0]]), # thumbs up
		[[[0,0],[-1,0],[1,0],[2,0],[-2,0]], # longer long
		[[0,0],[0,-1],[0,1],[0,2],[0,-2]]],       
		rotations([[0,0],[1,0],[0,1]]))   	#elbow 
	
	#All_My_Pieces = [
	#	rotations([[0,0],[-1,0],[-1,1],[0,1],[1,0]]), 	# temple
    #   rotations([[-2, 1], [-1, 1], [0, 1], [1, 1],	# jungle 
	#	[-2,0],[-1,0],[0,0],[1,0],[-1,-1],[0,-1],[1,-1]]),
	#	rotations([[0, 0], [0, 1], [1, 0], [1, 1]]), 	# boiler 
	#	rotations([[0, 0], [0, -1], [0, 1], [1, 1]]), 	# survey  
	#	[[0,0]]]   										#prison

	
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
		@cheating = false
		@current_block = MyPiece.next_piece(self)
	end
	
	def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    (0..(locations.length-1)).each{|index| 
      current = locations[index];
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] = 
      @current_pos[index]
    }
    remove_filled
    @delay = [@delay - 2, 80].max
	end
	
	def next_piece
		if @cheating
			@current_block = MyPiece.new([[0,0]], self)
			@cheating = false
		else
			@current_block = MyPiece.next_piece(self)
		end
		@current_pos = nil
	end
	
	def rotate_upside_down
		if !game_over? and @game.is_running?
			@current_block.move(0, 0, -2)
		end
		draw
	end
	
	def cheat
		if @score > 10 and !@cheating
			@score -= 10
			@cheating = true
		end
	end
	
	
	
end

class MyTetris < Tetris

	def set_board
		@canvas = TetrisCanvas.new
		@board = MyBoard.new(self)
		@canvas.place(@board.block_size * @board.num_rows + 3,
        @board.block_size * @board.num_columns + 6, 24, 80)
		@board.draw 
	end
	
	def key_bindings
		super
		@root.bind('u', proc {@board.rotate_upside_down}) 
		@root.bind('c', proc {@board.cheat}) 
		
	end
end


