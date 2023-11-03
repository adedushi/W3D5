class PolyTreeNode
    attr_reader :value, :parent, :children
    attr_writer :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        old_parent = @parent
        @parent = new_parent

        if !old_parent.nil?
            old_parent.children.delete(self)
        end

        if new_parent != nil && !new_parent.children.include?(self)
            new_parent.children << self  
        end
        
    end

end