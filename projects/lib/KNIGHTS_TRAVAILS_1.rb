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
        print array

    end

    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(@pos) 
        @board = Array.new(8) {Array.new(8,"")}
        @considered_positions = [@pos]
    end
        
end

