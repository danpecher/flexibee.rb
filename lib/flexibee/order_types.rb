module Flexibee
  OrderType = Struct.new(:id, :updated_at, :code, :name, :currency,
    :currency_ref, :currency_name)

  class OrderTypes
    def initialize(client)
      @client = client
    end

    def order_types
      find.map do |type|
        currency = type['mena'].split(':').last
        currency_name = type['mena@showAs'].split(':').last.strip
        Flexibee::OrderType.new(type['id'], type['lastUpdate'],
          type['kod'], type['nazev'], currency, type['mena@ref'], currency_name)
      end
    end

    def find(filter=nil)
      @client.get("/typ-objednavky-vydane", {}, filter)['winstrom']['typ-objednavky-vydane']
    end
  end
end
