module Flexibee
  InvoiceType = Struct.new(:id, :updated_at, :code, :name, :currency,
    :currency_ref, :currency_name)

  class InvoiceTypes

    attr_accessor :invoice_types

    def initialize(response)
      @invoice_types = []
      response.each do |type|
        currency = type['mena'].split(':').last
        currency_name = type['mena@showAs'].split(':').last.strip
        @invoice_types << Flexibee::InvoiceType.new(type['id'], type['lastUpdate'],
          type['kod'], type['nazev'], currency, type['mena@ref'], currency_name)
      end
    end
  end
end
