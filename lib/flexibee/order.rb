module Flexibee
  class Order
    attr_accessor :id, :created_at, :ext_id, :total, :email, :phone, :name,
                  :shipping_eq_billing, :street, :city, :postcode, :ic, :dic,
                  :shipping_street, :shipping_city, :shipping_postcode, :company

    ##
    # Order basic response
    #
    # {
    # 	"id" => "4797",
    #   external-ids: [
    #     "ext:{CUSTOM_STRING}:2925"
    #   ],
    #   datVyst: "2016-02-11+01:00",
    #   sumCelkem: "999.0",
    #   kontaktJmeno: "Name Surname",
    #   kontaktEmail: "boss@acmee.com",
    #   kontaktTel: "123456789",
    #   postovniShodna: "true",
    #   nazFirmy: "Name Surname",
    #   ulice: "Street Street#",
    #   mesto: "City",
    #   psc: "12345",
    #   ic: "",
    #   dic: "",
    #   faNazev: "Name Surname",
    #   faUlice: "Street Street#",
    #   faMesto: "City",
    #   faPsc: "12345",
    # }
    ##
    def initialize(response, client)
      @id = response['id'].to_i
      @created_at = response['datVyst']
      @ext_id = if response['external-ids'].count > 0
                  response['external-ids'][0]
                else
                  ''
                end
      @total = response['sumCelkem'].to_f
      @email = response['kontaktEmail']
      @phone = response['kontaktTel']
      @name = response['kontaktJmeno']
      @shipping_eq_billing = response['postovniShodna']
      @street = response['faUlice']
      @city = response['faMesto']
      @postcode = response['faPsc']
      @ic = response['ic']
      @dic = response['dic']
      @shipping_street = response['ulice']
      @shipping_city = response['mesto']
      @shipping_postcode = response['psc']
      @company = response['nazFirmy']
      @client = client
    end
  end
end
