module Flexibee
  InvoiceType = Struct.new(:id, :updated_at, :code, :name, :currency,
    :currency_ref, :currency_name)

  class InvoiceTypes
    def initialize(client)
      @client = client
    end

    def invoice_types
      find.map do |type|
        currency = type['mena'].split(':').last
        currency_name = type['mena@showAs'].split(':').last.strip
        Flexibee::InvoiceType.new(type['id'], type['lastUpdate'],
          type['kod'], type['nazev'], currency, type['mena@ref'], currency_name)
      end
    end

    def find(filter=nil)
      @client.get("/typ-faktury-vydane", {}, filter)['winstrom']['typ-faktury-vydane']
    end
  end
end
