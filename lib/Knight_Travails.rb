require_relative "PolyTreeNode.rb"
require 'byebug'
class KnightPathFinder
  attr_accessor :current_pos
  def initialize(target_position)
    @current_pos = [0, 0]
    @root = PolyTreeNode.new(@current_pos)
    
    @target_position = []
    @target_position << target_position[0].to_i
    @target_position << target_position[2].to_i
    @considered_positions = []
  end
# Read through all the instructions before beginning!
  def build_move_tree(node=@root)
    accurate_moves = knight_moves_from_pos(node.value)
    if accurate_moves == nil
      return nil
    end
      accurate_moves.each do |move|
        
        child = PolyTreeNode.new(move)
        node.add_child(child)
        build_move_tree(child)
      end
  end

 def knight_moves_from_pos(pos)
    row, col = pos
    accurate_moves = []
    knight_moves = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, 2], [1, -2], [2, -1], [2, 1]]
    knight_moves.each do |move|


      x, y = move
      if (row+x) >= 0 && (row+x) <=7 &&  (col+y) >= 0 && (col+y) <=7
        unless @considered_positions.include?(([row+x, col+y]))
          @considered_positions << [row+x,col+y]
          accurate_moves << [row+x,col+y] 
        end
      end
    end
    if accurate_moves.empty?
      return nil
    else
      accurate_moves
    end
  end
  def find_path()
    
    node = @root.bfs(@target_position)
    puts trace_back_path(node)
  end

  def new_move_positions(pos)
    new_moves = knight_moves_from_pos()
  end

  def trace_back_path(node)
    array = []
    array << [node.value]
    until node.parent.nil?
      array << node.parent.value
      node = node.parent
    end
    array.reverse
  end
end

# knight_moves_from_pos([2,2])
puts "What position would you like to find a path to"
target = gets.chomp
knight_tree = KnightPathFinder.new(target)
knight_tree.build_move_tree
knight_tree.find_path

# 1. Write a class, KnightPathFinder. Initialize your KnightPathFinder with a starting position. For instance:
# 2. Goal of project is kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]] to find paths to end positions
# 3. To help us find paths, we will build a move tree. The values  the tree will be positions. A node is a child of another node if you can move from the parent position directly to the child position. The root node of the tree should be the knights starting position
# 4. You will want to build on your PolyTreeNode work, using PolyTreeNode instances to represent each position.
# 5. Start by creating an instance variable, self.root_node that stores the knight, initial position in an instance of your PolyTreeNode class.
# 6. You will be writing an instance method KnightPathFinder#build_move_tree to build the move tree, beginning with self.root_node. Call this method in initialize; You will traverse the move tree whenever #find_path is called. Don't write this yet though.
# 7 Build new positions, find all posible moves from a given position.  Write a class method KnightPathFinder::valid_moves(pos). There are up to eight possible moves
# 8.You'll also want to avoid repeating positions in the move tree. For instance, we don't want to infinitely explore moving betweeen the same two positions. Add an instance variable, @considered_positions to keep track of the positions you have considered; initialize it to the array containing just the starting pos. Write an instance method #new_move_positions(pos); this should call the ::valid_moves class method, but filter out any positions that are already in @considered_positions. It should then add the remaining new positions to @considered_positions and return these new positions.

# Phase II: #build_move_tree
# Let's return to #build_move_tree. We'll use our #new_move_positions instance method.

# To ensure that your tree represents only the shortest path to a given position, build your tree in a breadth-first manner. Take inspiration from your BFS algorithm: use a queue to process nodes in FIFO order. Start with a root node representing the start_pos and explore moves from one position at a time.

# Next build nodes representing positions one move away, add these to the queue. Then take the next node from the queue... until the queue is empty.

# When you have completed, and tested, #build_move_tree get a code review from your TA.

# Head to Part 2!
# Once you are finished with phases 1 & 2 head over to Part Two. Accessing this on GitHub? Use this link.
#node=@root,&prc)
 # prc = Proc.new{|x,y| target_position[0]-x + target_position[1]-y}    
    #   child_map = node.children.map do |child|
    #     prc.call(child.value.first,child.value[1])
    #   end
    # find_path(child_map.children.min,&prc)