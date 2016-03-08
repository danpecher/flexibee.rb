require 'flexibee/version'
require 'flexibee/client/company'
require 'flexibee/client/product'
require 'flexibee/client/invoice_type'
require 'flexibee/client/order_type'
require 'flexibee/client'

module Flexibee
  class << self
    def method_missing(method_name, *args, &block)
      @client.send(method_name, *args, &block) if @client.respond_to? method_name
      super
    end
  end
end
