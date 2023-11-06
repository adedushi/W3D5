require "byebug"
require_relative 'tree_node'
class KnightPathFinder
    attr_accessor :pos, :board, :considered_positions

    def valid_moves(pos)
        array = []
        x, y = pos 
        array.push([x + 1, y + 2], 
        [x + 2, y + 1],
        [x + 2, y - 1],
        [x + 1, y - 2],
        [x - 1, y + 2],
        [x - 2, y + 1],
        [x - 1, y - 2], 
        [x - 2, y - 1])


        array.select!{|subs| subs.all?{|el| el < 8 && el >= 0}}

    end

    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(@pos) 
        @board = Array.new(8) {Array.new(8,"")}
        @considered_positions = [@pos]
    end

    def new_move_positions(pos)
        
        valid_moves = KnightPathFinder.valid_moves(pos)
        valid_moves.select!{ |move| !considered_positions.include?(move)}
        considered_positions += valid_moves
        valid_moves

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

