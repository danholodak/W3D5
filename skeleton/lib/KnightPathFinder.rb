require_relative "00_tree_node"
class KPFinder
    
    attr_reader :row, :col, :possible_moves, :accounted_move
    def initialize(pos)
        @row, @col = pos
        @possible_moves = []
        @root_node = PolyTreeNode.new(pos)
        @accounted_move = [pos]
    end

    def build_possible_moves(pos)
        x, y = pos
        @possible_moves << PolyTreeNode.new([x + 2, y + 1]) if valid_pos?([x + 2, y + 1])
        @possible_moves << PolyTreeNode.new([x - 2, y + 1]) if valid_pos?([x - 2, y + 1])
        @possible_moves << PolyTreeNode.new([x + 2, y - 1]) if valid_pos?([x + 2, y - 1])
        @possible_moves << PolyTreeNode.new([x - 1, y + 2]) if valid_pos?([x - 1, y + 2])
        @possible_moves << PolyTreeNode.new([x - 2, y - 1]) if valid_pos?([x - 2, y - 1])
        @possible_moves << PolyTreeNode.new([x + 1, y - 2]) if valid_pos?([x + 1, y - 2])
        @possible_moves << PolyTreeNode.new([x - 1, y - 2]) if valid_pos?([x - 1, y - 2])
        @possible_moves << PolyTreeNode.new([x + 1, y + 2]) if valid_pos?([x + 1, y + 2])
        
    end

    # def link_parent
    #     @possible_moves.each do |move|
    #         move.parent = self.root_node
    #         self.move_history << move.value
    #     end

    # end

    def build_move_tree
        # queue = @possible_moves
        while !@possible_moves.empty? do
            current = @possible_moves.shift
            if @accounted_move.include?(move)
                next
            else
                build_possible_moves(current.value)
            



    end

    def valid_pos?(pos)
        x, y = pos
        (0..7).include?(x) && (0..7).include?(y) && !accounted_move.include?(pos)


    end

        

end