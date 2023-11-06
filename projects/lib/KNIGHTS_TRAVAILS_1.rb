require "byebug"
require_relative 'tree_node'
class KnightPathFinder
    attr_accessor :pos, :board, :considered_positions
    MOVES = [[1, 2], 
            [2, 1],
            [2, -1],
            [1, -2],
            [-1, 2],
            [-2, 1],
            [-1, -2], 
            [- 2,  - 1]]

    def self.valid_moves(pos)
        array = []
        x, y = pos 
        MOVES.each do |move| 
            dx, dy = move
            new_move = [dx + x, dy + y]
            array << new_move if new_move.all? { |coord| coord >= 0 && coord < 8}
        end

        array
            end

        #     array.push([x + 1, y + 2], 
        #     [x + 2, y + 1],
        #     [x + 2, y - 1],
        #     [x + 1, y - 2],
        #     [x - 1, y + 2],
        #     [x - 2, y + 1],
        #     [x - 1, y - 2], 
        #     [x - 2, y - 1])

        # return array.select!{|subs| subs.all?{|el| el < 8 && el >= 0}}



    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(@pos) 
        @board = Array.new(8) {Array.new(8)}
        @considered_positions = [@pos]
    end

    def new_move_positions(pos)
        valid_move = KnightPathFinder.valid_moves(pos).select{|el| !considered_positions.include?(el)}
        considered_positions.concat(valid_move)
        valid_move
    end

    def build_move_tree
        queue=[@root_node]
        while !queue.empty?
            el = queue.shift
            possible_moves = new_move_positions(el.value)
            possible_moves.each do |move|
                node = PolyTreeNode.new(move)
                el.add_child(node)
                queue << node
            end
        end
    end


end

