class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end
    def parent=(new_parent)
        @parent = new_parent
       if !new_parent.children.include?(self) && self.parent.children != nil 
       new_parent.children<<self     
       end
    end
end

a = PolyTreeNode.new("a")
puts a