require 'rest-client'

module Flexibee
  class Client
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

    def company
      @company = Company.new(base_response)
    end

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
