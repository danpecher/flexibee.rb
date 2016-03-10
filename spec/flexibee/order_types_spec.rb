describe Flexibee::OrderTypes, vcr: true do
  describe '#initialize' do
    it 'gets basic order types response' do
      VCR.use_cassette 'order_types/api_response' do
        types = @flexibee.order_types
        expect(types).not_to be_empty
        expect(types).to all( be_an(Flexibee::OrderType) )
      end
    end
  end

  describe '#OrderType' do
    before do
      VCR.use_cassette 'order_types/api_response' do
        @example = @flexibee.order_types.first
      end
    end

    it 'gets type id' do
      expect(@example.id).to eql("22")
    end

    it 'gets type updated_at' do
      expect(@example.updated_at).to eql("2010-05-13T00:00:00+02:00")
    end

    it 'gets type code' do
      expect(@example.code).to eql("OBV")
    end

    it 'gets type name' do
      expect(@example.name).to eql("Objednávka vydaná")
    end

    it 'gets type currency' do
      expect(@example.currency).to eql("CZK")
    end

    it 'gets type currency_ref' do
      expect(@example.currency_ref).to eql("/c/esperia_test/mena/31.json")
    end

    it 'gets type currency_name' do
      expect(@example.currency_name).to eql("Česká koruna")
    end
  end
end
