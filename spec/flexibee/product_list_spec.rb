describe Flexibee::ProductList, vcr: true do
  describe '#all' do
    it 'gets basic products response' do
      VCR.use_cassette 'product/api_response_list' do
        @products = @flexibee.product_list
        expect(@products).to be_an(Flexibee::ProductList)
        expect(@products.all).not_to be_empty
        expect(@products.all).to all( be_an(Flexibee::Product) )
      end
    end
  end

  describe '.find_by_id' do
    it 'gets product by id' do
      VCR.use_cassette 'product/api_response_by_id' do
        @products = @flexibee.product_list
        product = @products.find_by_id(2376)
        expect(product).to be_an(Flexibee::Product)
        expect(product.id).to eql(2376)
      end
    end
  end

  describe '.find_by_name' do
    it 'gets product by name' do
      VCR.use_cassette 'product/api_response_by_name' do
        @products = @flexibee.product_list
        product = @products.find_by_name('Tenisky STAN SMITH Black/Black')
        expect(product).to be_an(Flexibee::Product)
        expect(product.name).to eql('Tenisky STAN SMITH Black/Black')
      end
    end
  end

  describe '.find_by_ean' do
    it 'gets product by ean' do
      VCR.use_cassette 'product/api_response_by_ean' do
        @products = @flexibee.product_list
        product = @products.find_by_ean('9343783000326')
        expect(product).to be_an(Flexibee::Product)
        expect(product.ean).to eql('9343783000326')
      end
    end
  end
end
