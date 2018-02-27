# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

#Notes on provided:
#


require_relative './hw6gragdadaphics'

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
	All_My_Pieces = [[[[0, 0], [1, 0], [0, 1], [1, 1]]],  # square (only needs one)
               rotations([[0, 0], [-1, 0], [1, 0], [0, -1]]), # T
               [[[0, 0], [-1, 0], [1, 0], [2, 0]], # long (only needs two)
               [[0, 0], [0, -1], [0, 1], [0, 2]]],
               rotations([[0, 0], [0, -1], [0, 1], [1, 1]]), # L
               rotations([[0, 0], [0, -1], [0, 1], [-1, 1]]), # inverted L
               rotations([[0, 0], [-1, 0], [0, -1], [1, -1]]), # S
               rotations([[0, 0], [1, 0], [0, -1], [-1, -1]]), # Z
			   [[[0, 0], [-1, 0], [1, 0], [2, 0],[-2, 0]], # longer long
               [[0, 0], [0, -1], [0, 1], [0, 2], [0,-2]]]
               rotations([[0,0],[1,0],[0,1]]), #small L
			   rotations([[0,0],[-1,0],[-1,1],[0,1],[1,0]])] # thumbs up
  # your enhancements here
  
	def initialize(x,y,c)
		super(point_array, board)
		
	end
	
	def self.next_piece (board)
		Piece.new(All_My_Pieces.sample, board)
	end
	
end

class MyBoard < Board
  # your enhancements here

end

class MyTetris < Tetris
  # your enhancements here

end


