require_relative "polytreenode"
class KnightPathFinder

  def initialize(target_position)
    @current_pos = [0, 0]
    @target_position = target_position
  end
end
Read through all the instructions before beginning!


# 1. Write a class, KnightPathFinder. Initialize your KnightPathFinder with a starting position. For instance:
2. Goal of project is kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]] to find paths to end positions
3. To help us find paths, we will build a move tree. The values in the tree will be positions. A node is a child of another node if you can move from the parent position directly to the child position. The root node of the tree should be the knights starting position
4. You will want to build on your PolyTreeNode work, using PolyTreeNode instances to represent each position.
5. Start by creating an instance variable, self.root_node that stores the knight, initial position in an instance of your PolyTreeNode class.
6. You will be writing an instance method KnightPathFinder#build_move_tree to build the move tree, beginning with self.root_node. Call this method in initialize; You will traverse the move tree whenever #find_path is called. Don't write this yet though.
7 Build new positions, find all posible moves from a given position.  Write a class method KnightPathFinder::valid_moves(pos). There are up to eight possible moves
8.You'll also want to avoid repeating positions in the move tree. For instance, we don't want to infinitely explore moving betweeen the same two positions. Add an instance variable, @considered_positions to keep track of the positions you have considered; initialize it to the array containing just the starting pos. Write an instance method #new_move_positions(pos); this should call the ::valid_moves class method, but filter out any positions that are already in @considered_positions. It should then add the remaining new positions to @considered_positions and return these new positions.

Phase II: #build_move_tree
Let's return to #build_move_tree. We'll use our #new_move_positions instance method.

To ensure that your tree represents only the shortest path to a given position, build your tree in a breadth-first manner. Take inspiration from your BFS algorithm: use a queue to process nodes in FIFO order. Start with a root node representing the start_pos and explore moves from one position at a time.

Next build nodes representing positions one move away, add these to the queue. Then take the next node from the queue... until the queue is empty.

When you have completed, and tested, #build_move_tree get a code review from your TA.

Head to Part 2!
Once you are finished with phases 1 & 2 head over to Part Two. Accessing this on GitHub? Use this link.

