module Flexibee
  class Product
    attr_accessor :id, :updated_at, :code, :name, :price_base, :price_no_vat,
      :price_vat, :stock, :note, :description, :ean, :vat

    ##
    # Product basic response
    #
    # {
    # 	"id" => "4797",
    # 	"lastUpdate" => "2015-09-30T15:42:45.190+02:00",
    # 	"kod" => "B0002",
    # 	"nazev" => "Dámský zvýhodněný balíček",
    # 	"cenaZakl" => "1361.157024",
    # 	"cenaZaklBezDph" => "1361.157024",
    # 	"cenaZaklVcDph" => "1646.999999",
    #   "sumDostupMj" =>  "0.0",
    #   "poznam" => "NENÍ FOTO",
    #   "popis" => "",
    #   "eanKod" => "",
    #   "szbDph" => "21.0"
    # }
    ##
    def initialize(response, client)
      @id = response['id'].to_i
      @updated_at = response['lastUpdate']
      @code = response['kod']
      @name = response['nazev']
      @price_base = response['cenaZakl'].to_f
      @price_no_vat = response['cenaZaklBezDph'].to_f
      @price_vat = response['cenaZaklVcDph'].to_f
      @stock = response['sumDostupMj'].to_f
      @note = response['poznam']
      @description = response['popis']
      @ean = response['eanKod']
      @vat = response['szbDph'].to_f
      @client = client
    end

    # TODO test
    def category
      uzel_id = find_relationship ? find_relationship['uzel'] : find_relationship
      uzel_id ? @client.tree.find_by_id(uzel_id.to_i).first : nil
    end

    # TODO test
    def find_relationship
      @client.get("/strom-cenik", { detail: 'full' }, "idZaznamu='#{id}'")['winstrom']['strom-cenik'][0]
    end
  end
end
