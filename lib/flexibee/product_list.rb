module Flexibee
  class ProductList
    ##
    # By default called with { detail: 'full' }, normal response does not have any useful information in it
    ##
    def initialize(client)
      @client = client
    end

    def all(params={})
      create_products(find(nil, params))
    end

    def find(filter=nil, params={})
      @client.get("/cenik", params.merge({ detail: 'full' }), filter)['winstrom']['cenik']
    end

    def find_by_id(id)
      create_products(find("id='#{id}'")).first
    end

    def find_by_name(name)
      create_products(find("nazev='#{name}'")).first
    end

    def find_by_ean(ean)
      create_products(find("eanKod='#{ean}'")).first
    end

    private

    def create_products(response)
      response.map { |p| Flexibee::Product.new(p, @client) }
    end
  end
end
