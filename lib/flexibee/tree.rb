module Flexibee
  class Tree
    attr_accessor :nodes

    def initialize(response)
      @nodes = []
      response.each do |node|
        @nodes << Flexibee::Node.new(node)
      end
    end
  end
end
