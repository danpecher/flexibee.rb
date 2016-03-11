module Flexibee
  class Tree
    attr_accessor :nodes

    def initialize(response)
      @nodes = []
      response.each do |node|
        @nodes << Flexibee::Node.new(node)
      end
    end

    def root
      
    end
  end
end
