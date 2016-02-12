require 'rest-client'

module Flexibee
  class Client
    include Flexibee::Client::Company
    include Flexibee::Client::Product
    include Flexibee::Client::InvoiceType
    include Flexibee::Client::OrderType

    def initialize(user_id, login, password, company_id)
      @user_id = user_id
      @login = login
      @password = password
      @company_id = company_id

      @base_url = "https://#{login}:#{password}@#{user_id}.flexibee.eu:5434/c/#{company_id}"
    end

    def get(url, params = {}, filter = nil)
      unless filter.nil?
        url << '/' + URI::escape("(#{filter})")
      end
      url << '.json'
      JSON.parse(RestClient.get(url, params))
    end

  end
end