require_relative "00_tree_node"
class KPFinder
    
    attr_reader :row, :col
    def initialize(pos)
        @row, @col = pos
        @possible_moves = []
        @root_node = PolyTreeNode.new(pos)
    end

    def build_move_tree
        @possible_moves << [@row + 2, @col + 1] if valid_pos?([@row + 2, @col + 1])
        @possible_moves << [@row - 2, @col + 1] if valid_pos?([@row - 2, @col + 1])
        @possible_moves << [@row + 2, @col - 1] if valid_pos?([@row + 2, @col - 1])
        @possible_moves << [@row - 1, @col + 2] if valid_pos?([@row - 1, @col + 2])
        @possible_moves << [@row - 2, @col - 1] if valid_pos?([@row - 2, @col - 1])
        @possible_moves << [@row + 1, @col - 2] if valid_pos?([@row + 1, @col - 2])
        @possible_moves << [@row - 1, @col - 2] if valid_pos?([@row - 1, @col - 2])
        @possible_moves << [@row + 1, @col + 2] if valid_pos?([@row + 1, @col + 2])
    end

    def valid_pos?(pos)
        x, y = pos
        (0..7).include?(x) && (0..7).include?(y)
    end

        

end