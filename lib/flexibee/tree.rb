module Flexibee
  class Tree
    def initialize(client)
      @client = client
    end

    def all
      create_nodes(find)
    end

    def find(filter=nil)
      @client.get("/strom", { detail: 'full', limit: 0 }, filter)['winstrom']['strom']
    end

    def root
      level.first
    end

    def level(level=1)
      create_nodes(find("hladina='#{level}'"))
    end

    def find_by_id(id)
      create_nodes(find("id='#{id}'"))
    end

    def children_of(node_id)
      create_nodes(find("otec='#{node_id}'"))
    end

    def parent_for(parent_id)
      create_nodes(find("id='#{parent_id}'"))
    end

    private

    def create_nodes(response)
      response.map{ |n| Flexibee::Node.new(n, self) }
    end
  end
end
