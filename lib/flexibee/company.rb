module Flexibee
  class Company
    ##
    # getting custom info from company response
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
    attr_accessor :base_response

    def initialize(base_response)
      @base_response = base_response
    end

    def info
      base_response['companies']['company']
    end

    def id
      info['id']
    end

    def name
      info['nazev']
    end

    def db_name
      info['dbNazev']
    end

    def created_at
      info['createDt']
    end
  end
end
