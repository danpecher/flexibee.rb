describe Flexibee::Products, vcr: true do
  describe '#initialize' do
    it 'gets basic products response' do
      VCR.use_cassette 'products/api_response' do
        products = @flexibee.products
        expect(products).not_to be_empty
        expect(products).to all( be_an(Flexibee::Product) )
      end
    end
  end

  describe '#Product' do
    before do
      VCR.use_cassette 'products/api_response' do
        @example = @flexibee.products.first
      end
    end

    it 'gets product id' do
      expect(@example.id).to eql("4796")
    end

    it 'gets product updated_at' do
      expect(@example.updated_at).to eql("2015-09-16T16:59:58.646+02:00")
    end

    it 'gets product code' do
      expect(@example.code).to eql("B0001")
    end

    it 'gets product name' do
      expect(@example.name).to eql("Zvýhodněný nabijecí balíček pro iPhone 5/5S/6/6S/6 Plus/6S Plus")
    end

    it 'gets product price_base' do
      expect(@example.price_base).to eql(661.157025)
    end

    it 'gets product price_no_vat' do
      expect(@example.price_no_vat).to eql(661.157025)
    end

    it 'gets product price_vat' do
      expect(@example.price_vat).to eql(800.0)
    end

    it 'gets product vat' do
      expect(@example.vat).to eql(21.0)
    end
  end
end
