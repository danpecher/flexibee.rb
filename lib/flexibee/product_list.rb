module Flexibee
  class ProductList
    attr_accessor :product_list

    def initialize(client)
      response = client.get("/cenik", { detail: 'full' }, nil)['winstrom']['cenik']

      @product_list = []
      response.each do |product|
        @product_list << Flexibee::Product.new(product)
      end
    end
  end
end
