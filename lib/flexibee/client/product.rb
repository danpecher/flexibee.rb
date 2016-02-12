module Flexibee
  class Client
    module Product
      def product_list(params = {}, filter = nil)
        get("#{@base_url}/cenik", params, filter)['winstrom']['cenik']
      end
    end
  end
end