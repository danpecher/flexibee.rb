module Flexibee
  class Tree
    attr_accessor :nodes

    def initialize(response)
      @nodes = []
      response.each do |node|
        new_node = Flexibee::Node.new(node)
        new_node.tree = self
        @nodes << new_node
      end
    end

    def root
      level.first
    end

    def level(level=1)
      nodes.select { |node| node.level == level }
    end
  end
end
