module Flexibee
  class Client
    module Company
      def company_info
        get("#{@base_url}")['companies']['company']
      end
    end
  end
end