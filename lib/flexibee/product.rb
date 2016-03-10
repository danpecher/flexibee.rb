module Flexibee
  class Product
    def product_list(params = {}, filter = nil)
      @flexibee.get("#{@base_url}/cenik", params, filter)['winstrom']['cenik']
    end
  end
end
