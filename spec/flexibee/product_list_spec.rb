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

    it 'gets products with limit filter applied' do
      VCR.use_cassette 'product/api_response_all_limit' do
        limited = @flexibee.product_list.all({limit: 12})
        expect(limited).not_to be_empty
        expect(limited).to all( be_an(Flexibee::Product) )
        expect(limited.count).to eql(12)
      end
    end

    it 'gets products with start filter applied' do
      VCR.use_cassette 'product/api_response_all_start' do
        started = @flexibee.product_list.all({start: 19})
        expect(started).not_to be_empty
        expect(started).to all( be_an(Flexibee::Product) )
        expect(started.first.id).to eql(@flexibee.product_list.all.last.id)
        expect(started.count).to eql(20)
      end
    end

    it 'gets products with limit and start filter applied' do
      VCR.use_cassette 'product/api_response_all_astart_and_limit' do
        start_limited = @flexibee.product_list.all({start: 19, limit: 12})
        expect(start_limited).not_to be_empty
        expect(start_limited).to all( be_an(Flexibee::Product) )
        expect(start_limited.first.id).to eql(@flexibee.product_list.all.last.id)
        expect(start_limited.count).to eql(12)
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
