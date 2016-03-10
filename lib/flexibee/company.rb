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
    attr_accessor :info, :id, :name, :db_name, :created_at

    def initialize(response)
      @info = response['companies']['company']
      @id = response['companies']['company']['id']
      @name = response['companies']['company']['nazev']
      @db_name = response['companies']['company']['dbNazev']
      @created_at = response['companies']['company']['createDt']
    end
  end
end
