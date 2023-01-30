require_relative "00_tree_node"

require "byebug"

class KPFinder
    
    attr_reader :row, :col, :possible_moves, :accounted_move, :root_node
    def initialize(pos)
        @row, @col = pos
        @possible_moves = []
        @root_node = PolyTreeNode.new(pos)
        @accounted_move = [pos]
    end

    def build_possible_moves(pos=nil)
       pos ||= [self.row, self.col]
        x, y = pos
        new_moves = []
        new_moves << PolyTreeNode.new([x + 2, y + 1]) if valid_pos?([x + 2, y + 1])
        new_moves << PolyTreeNode.new([x - 2, y + 1]) if valid_pos?([x - 2, y + 1])
        new_moves << PolyTreeNode.new([x + 2, y - 1]) if valid_pos?([x + 2, y - 1])
        new_moves << PolyTreeNode.new([x - 1, y + 2]) if valid_pos?([x - 1, y + 2])
        new_moves << PolyTreeNode.new([x - 2, y - 1]) if valid_pos?([x - 2, y - 1])
        new_moves << PolyTreeNode.new([x + 1, y - 2]) if valid_pos?([x + 1, y - 2])
        new_moves << PolyTreeNode.new([x - 1, y - 2]) if valid_pos?([x - 1, y - 2])
        new_moves << PolyTreeNode.new([x + 1, y + 2]) if valid_pos?([x + 1, y + 2])
        @possible_moves.concat(new_moves)
        return(new_moves)
    end

    # def link_parent
    #     @possible_moves.each do |move|
    #         move.parent = self.root_node
    #         self.move_history << move.value
    #     end

    # end

    def build_move_tree
        self.build_possible_moves.each do |move|
            move.parent = @root_node
            @root_node.children << move
        end

        # queue = @possible_moves
        while !@possible_moves.empty? do
            current = @possible_moves.shift

            if @accounted_move.include?(current.value)
                next
            else
                @accounted_move << current.value
                build_possible_moves(current.value).each do |move|
                    move.parent = current
                end
                
            end
        end


    end

    def valid_pos?(pos)
        x, y = pos
        (0..7).include?(x) && (0..7).include?(y) && !accounted_move.include?(pos)


    end

    def find_path(end_pos)

        found_node = @root_node.dfs(end_pos)
        
        return KPFinder.trace_path_back(@root_node.value,found_node)
        

    end


    def self.trace_path_back(start_pos, node)

        path = []

        path << node.value

        current_node = node
        # debugger
        while path[0] != start_pos
            # debugger
            path.unshift(current_node.parent.value)
            current_node = current_node.parent
        end

        return path


    end
        

end