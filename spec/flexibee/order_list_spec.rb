describe Flexibee::OrderList, vcr: true do
  describe '#all' do
    it 'gets basic orders response' do
      VCR.use_cassette 'order/api_response_list' do
        @orders = @flexibee.order_list
        expect(@orders).to be_an(Flexibee::OrderList)
        expect(@orders.all).not_to be_empty
        expect(@orders.all).to all( be_an(Flexibee::Order) )
      end
    end

    it 'gets orders with limit filter applied' do
      VCR.use_cassette 'order/api_response_all_limit' do
        limited = @flexibee.order_list.all({limit: 12})
        expect(limited).not_to be_empty
        expect(limited).to all( be_an(Flexibee::Order) )
        expect(limited.count).to eql(12)
      end
    end

    it 'gets orders with start filter applied' do
      VCR.use_cassette 'order/api_response_all_start' do
        started = @flexibee.order_list.all({start: 19})
        expect(started).not_to be_empty
        expect(started).to all( be_an(Flexibee::Order) )
        expect(started.first.id).to eql(@flexibee.order_list.all.last.id)
        expect(started.count).to eql(20)
      end
    end

    it 'gets orders with limit and start filter applied' do
      VCR.use_cassette 'order/api_response_all_astart_and_limit' do
        start_limited = @flexibee.order_list.all({start: 19, limit: 12})
        expect(start_limited).not_to be_empty
        expect(start_limited).to all( be_an(Flexibee::Order) )
        expect(start_limited.first.id).to eql(@flexibee.order_list.all.last.id)
        expect(start_limited.count).to eql(12)
      end
    end
  end

  describe '.find_by_id' do
    it 'gets order by id' do
      VCR.use_cassette 'order/api_response_by_id' do
        @orders = @flexibee.order_list
        order = @orders.find_by_id(2927)
        expect(order).to be_an(Flexibee::Order)
        expect(order.id).to eql(2927)
      end
    end
  end
end
