module Flexibee
  class OrderType
    def order_types(params = {}, filter = nil)
      get("#{@base_url}/typ-objednavky-vydane", params, filter)['winstrom']['typ-objednavky-vydane']
    end
  end
end
