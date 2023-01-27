class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value, parent=nil, children=[])
        @value = value
        @parent = parent
        @children = children
    end

    def parent=(parent_node)
        old_parent = parent
        @parent = parent_node
        if old_parent != nil
            parent_node.children << self 
            old_parent.children.pop
        end
    end

end