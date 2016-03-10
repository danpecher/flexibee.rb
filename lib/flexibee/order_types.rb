module Flexibee
  OrderType = Struct.new(:id, :updated_at, :code, :name, :currency,
    :currency_ref, :currency_name)

  class OrderTypes
    attr_accessor :order_types

    def initialize(response)
      @order_types = []
      response.each do |type|
        currency = type['mena'].split(':').last
        currency_name = type['mena@showAs'].split(':').last.strip
        @order_types << Flexibee::OrderType.new(type['id'], type['lastUpdate'],
          type['kod'], type['nazev'], currency, type['mena@ref'], currency_name)
      end
    end
  end
end
