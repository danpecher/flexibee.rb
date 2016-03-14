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
    end

    def base_url
      "https://#{@login}:#{@password}@#{@user_id}.flexibee.eu:5434/c/#{@company_id}"
    end

    def base_response
      get
    end

    ##
    # flexibee obejcts
    ##
    def company
      @company ||= Company.new(base_response)
    end

    def invoice_types(params = {}, filter = nil)
      @invoice_types = InvoiceTypes.new(
        get("/typ-faktury-vydane", params, filter)['winstrom']['typ-faktury-vydane']).invoice_types
    end

    def order_types(params = {}, filter = nil)
      @order_types = OrderTypes.new(
        get("/typ-objednavky-vydane", params, filter)['winstrom']['typ-objednavky-vydane']).order_types
    end

    ##
    # By default called with { detail: 'full' }, normal response does not have any usefull information in it
    ##
    def product_list(params = { detail: 'full' }, filter = nil)
      @products = ProductList.new(self).product_list
    end

    ##
    # By default called with { detail: 'full' }, normal response does not have any usefull information in it
    # Also to get whole list of categories default passes { limit: 0 } to get default pass { limit: 20 }
    ##
    def tree(params = { detail: 'full', limit: 0 }, filter = nil)
      @tree = Tree.new(get("/strom", params, filter)['winstrom']['strom'])
    end

    ##
    # flexibee base call methods
    ##
    def get(route='', params = {}, filter = nil)
      url = base_url + route
      unless filter.nil?
        url << '/' + URI::escape("(#{filter})")
      end
      url << '.json'
      begin
        JSON.parse(RestClient.get(url, params: params))
      rescue RestClient::ResourceNotFound => e
        Object.new
      end
    end

  end
end
