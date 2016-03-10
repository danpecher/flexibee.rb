require 'rest-client'

module Flexibee
  class Client
    ##
    # working with base response from flexibee
    #
    # {
    #   "companies" => {
    #     "company" => {
    #       "createDt" => "2015-10-17T18:26:39.692+02:00",
    #       "dbNazev" => "esperia_test",
    #       "id" => "1",
    #       "licenseGroup" => "04fc91491a9647d451649736ad8127e2",
    #       "nazev" => "esperia-test",
    #       "show" => "true",
    #       "stavEnum" => "ESTABLISHED",
    #       "watchingChanges" => "false"
    #     }
    #   }
    # }
    ##

    def initialize(user_id, login, password, company_id)
      @user_id = user_id
      @login = login
      @password = password
      @company_id = company_id

      @base_url = base_url
    end

    def base_url
      "https://#{@login}:#{@password}@#{@user_id}.flexibee.eu:5434/c/#{@company_id}"
    end

    def base_response
      get(@base_url)
    end

    ##
    # flexibee obejcts
    ##
    def company
      @company ||= Company.new(base_response)
    end

    def invoice_types(params = {}, filter = nil)
      @invoice_types = InvoiceTypes.new(
        get("#{base_url}/typ-faktury-vydane",
          params, filter)['winstrom']['typ-faktury-vydane']).invoice_types
    end

    def order_types(params = {}, filter = nil)
      @order_types = OrderTypes.new(
        get("#{@base_url}/typ-objednavky-vydane",
          params, filter)['winstrom']['typ-objednavky-vydane']).order_types
    end

    def products(params = {}, filter = nil)
      @products = Products.new(
        get("#{@base_url}/cenik", params, filter)['winstrom']['cenik']).product_list
    end

    ##
    # flexibee base call methods
    ##
    def get(url, params = {}, filter = nil)
      unless filter.nil?
        url << '/' + URI::escape("(#{filter})")
      end
      url << '.json'
      begin
        JSON.parse(RestClient.get(url, params))
      rescue RestClient::ResourceNotFound => e
        Object.new
      end
    end

  end
end
