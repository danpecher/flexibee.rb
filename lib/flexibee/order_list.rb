module Flexibee
  class OrderList
    ##
    # By default called with { detail: 'full' }, normal response does not have any useful information in it
    ##
    def initialize(client)
      @client = client
    end

    def all(params={})
      create_orders(find(nil, params))
    end

    def find(filter=nil, params={})
      @client.get('/objednavka-prijata', params.merge({detail: 'full' }), filter)['winstrom']['objednavka-prijata']
    end

    def find_by_id(id)
      create_orders(find("id='#{id}'")).first
    end

    private

    def create_orders(response)
      response.map { |p| Flexibee::Order.new(p, @client) }
    end
  end
end
