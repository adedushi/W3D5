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
        considered_positions << pos if !considered_positions.include?(pos) 
        return valid_moves(pos)
    end
    def build_move_tree
        queue=[@root_node]
        while !queue.empty?
            el=queue.shift
            if el.pos == [7,7]
                return true 
            else
                queue << valid_moves(el)
            end
        end
        return nil 
    end
end

