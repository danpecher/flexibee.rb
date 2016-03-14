describe Flexibee::ProductList, vcr: true do
  describe '#initialize' do
    it 'gets basic products response' do
      VCR.use_cassette 'product_list/api_response' do
        products = @flexibee.product_list
        expect(products).not_to be_empty
        expect(products).to all( be_an(Flexibee::Product) )
      end
    end
  end
end
