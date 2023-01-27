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
        if parent_node != nil && !parent_node.children.include?(self)
            parent_node.children << self
        end
        if old_parent != nil && old_parent != parent_node
            old_parent.children.delete(self)
        end
    end

    def add_child(child_node)
        child_node.parent=self
    end

    def remove_child(child_node)
        if !self.children.include?(child_node)
            raise ArgumentError.new("Not a child")
        end
        child_node.parent=nil
    end



    def dfs(target)
        return self if self.value == target

        self.children.each do |child|
            next_child_val = child.dfs(target)
            if next_child_val == nil
                next
            else
                return next_child_val
            end
        end
        return nil
    end

    def bfs(target)
        queue = [self]

        while !queue.empty? do 
            current = queue.shiftg
            if current.value == target
                return current
            else
                queue += current.children
            end

        end

        return nil

    end
        



end