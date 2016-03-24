describe Flexibee::Order, vcr: true do
  before do
    VCR.use_cassette 'order/api_response' do
      @order ||= @flexibee.order_list.all.first
      @order_last ||= @flexibee.order_list.all.last
    end
  end

  describe '#initialize' do
    it 'gets basic order response' do
      expect(@order).to be_an(Flexibee::Order)
      expect(@order_last).to be_an(Flexibee::Order)
    end
  end

  describe '#id' do
    it 'gets order id' do
      expect(@order.id).to eql(2927)
      expect(@order_last.id).to eql(2918)
    end
  end

  describe '#created_at' do
    it 'gets order created_at' do
      expect(@order.created_at).to eql('2016-02-11+01:00')
      expect(@order_last.created_at).to eql('2016-02-10+01:00')
    end
  end
  describe '#total' do
    it 'gets order total' do
      expect(@order.total).to eql(1180.0)
      expect(@order_last.total).to eql(1740.0)
    end
  end
  describe '#email' do
    it 'gets order email' do
      expect(@order.email).to match(/.*@.*\..*/)
      expect(@order_last.email).to match(/.*@.*\..*/)
    end
  end
  describe '#phone' do
    it 'gets order phone' do
      expect(@order.phone).to match(/\d+/)
      expect(@order_last.phone).to match(/\d+/)
    end
  end
  describe '#name' do
    it 'gets order name' do
      expect(@order.name).to be_a(String)
      expect(@order_last.name).to be_a(String)
    end
  end
  describe '#shipping_eq_billing' do
    it 'gets order shipping_eq_billing' do
      expect(%w(true false)).to include @order.shipping_eq_billing
      expect(%w(true false)).to include @order_last.shipping_eq_billing
    end
  end
  describe '#street' do
    it 'gets order street' do
      expect(@order.street).to be_a(String)
      expect(@order_last.street).to be_a(String)
    end
  end
  describe '#city' do
    it 'gets order city' do
      expect(@order.city).to be_a(String)
      expect(@order_last.city).to be_a(String)
    end
  end
  describe '#postcode' do
    it 'gets order postcode' do
      expect(@order.postcode).to match(/\d\d ?\d\d\d/)
      expect(@order_last.postcode).to match(/\d\d ?\d\d\d/)
    end
  end
  describe '#ic' do
    it 'gets order ic' do
      expect(@order.ic).to be_a(String)
      expect(@order_last.ic).to be_a(String)
    end
  end
  describe '#dic' do
    it 'gets order dic' do
      expect(@order.dic).to be_a(String)
      expect(@order_last.dic).to be_a(String)
    end
  end
  describe '#shipping_street' do
    it 'gets order shipping_street' do
      expect(@order.shipping_street).to be_a(String)
      expect(@order_last.shipping_street).to be_a(String)
    end
  end
  describe '#shipping_city' do
    it 'gets order shipping_city' do
      expect(@order.shipping_city).to be_a(String)
      expect(@order_last.shipping_city).to be_a(String)
    end
  end
  describe '#shipping_postcode' do
    it 'gets order shipping_postcode' do
      expect(@order.shipping_postcode).to be_a(String)
      expect(@order_last.shipping_postcode).to be_a(String)
    end
  end
  describe '#company' do
    it 'gets order company' do
      expect(@order.company).to be_a(String)
      expect(@order_last.company).to be_a(String)
    end
  end
end
