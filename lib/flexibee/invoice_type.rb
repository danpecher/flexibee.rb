module Flexibee
  class InvoiceType
    def invoice_types(params = {}, filter = nil)
      get("#{@base_url}/typ-faktury-vydane", params, filter)['winstrom']['typ-faktury-vydane']
    end
  end
end
