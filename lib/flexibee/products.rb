module Flexibee
  ##
  # Product basic response
  #
  # {
  # 	"id" => "4797",
  # 	"lastUpdate" => "2015-09-30T15:42:45.190+02:00",
  # 	"kod" => "B0002",
  # 	"nazev" => "Dámský zvýhodněný balíček Epico Hero body 2015 pro iPhone 5",
  # 	"cenaZakl" => "1361.157024",
  # 	"cenaZaklBezDph" => "1361.157024",
  # 	"cenaZaklVcDph" => "1646.999999",
  # 	"szbDph" => "21.0"
  # }
  ##
  Product = Struct.new(:id, :updated_at, :code, :name, :price_base, :price_no_vat,
    :price_vat, :vat)

  class Products
    attr_accessor :product_list

    def initialize(response)
      @product_list = []
      response.each do |product|
        @product_list << Flexibee::Product.new(product['id'], product['lastUpdate'],
          product['kod'], product['nazev'], product['cenaZakl'].to_f,
          product['cenaZaklBezDph'].to_f, product['cenaZaklVcDph'].to_f,
          product['szbDph'].to_f)
      end
    end
  end
end
