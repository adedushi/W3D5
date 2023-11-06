require_relative 'tree_node'
class KnightPathFinder
    def self.valid_moves(pos)
        array=[]
        x, y = pos 
        array.push([x + 1, y + 2], [x + 2, y + 1],[x + 2, y - 1],[x + 1, y - 2],[x - 1, y + 2],[x - 2, y + 1],[x - 1, y - 2], [x - 2, y - 1])
        array.select!{|subs| subs.any?{|el| el < 8 && el >= 0}}
        if array.empty?
         return false 
        else
            return true
        end
    end

    def initialize(pos)
        @pos =pos 
        @board = Array.new(8) {Array.new(8) {[]}}
        @considered_positions=[@pos]
    end
        
end