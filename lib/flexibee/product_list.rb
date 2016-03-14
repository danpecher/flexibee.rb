module Flexibee
  class ProductList
    ## TODO limit, start

    ##
    # By default called with { detail: 'full' }, normal response does not have any usefull information in it
    ##
    def initialize(client)
      @client = client
    end

    def all
      create_products(find)
    end

    def find(filter=nil)
      @client.get("/cenik", { detail: 'full' }, filter)['winstrom']['cenik']
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
      response.map { |p| Flexibee::Product.new(p) }
    end
  end
end
