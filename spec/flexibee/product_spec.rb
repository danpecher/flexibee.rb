describe Flexibee::Product, vcr: true do
  before do
    VCR.use_cassette 'product/api_response' do
      @product ||= @flexibee.product_list.first
      @product_last ||= @flexibee.product_list.last
    end
  end

  describe '#initialize' do
    it 'gets basic product response' do
      expect(@product).to be_an(Flexibee::Product)
      expect(@product_last).to be_an(Flexibee::Product)
    end
  end

  describe '#id' do
    it 'gets product id' do
      expect(@product.id).to eql(2346)
      expect(@product_last.id).to eql(2767)
    end
  end

  describe '#updated_at' do
    it 'gets product updated_at' do
      expect(@product.updated_at).to eql('2016-01-05T12:16:42.106+01:00')
      expect(@product_last.updated_at).to eql('2016-02-06T18:16:41.784+01:00')
    end
  end

  describe '#code' do
    it 'gets product code' do
      expect(@product.code).to eql('ADI-001-BLK-42')
      expect(@product_last.code).to eql('ADI-003-BLK-46')
    end
  end

  describe '#name' do
    it 'gets product name' do
      expect(@product.name).to eql('Tenisky STAN SMITH Black/Black')
      expect(@product_last.name).to eql('Tenisky LOS ANGELES Black')
    end
  end

  describe '#price_base' do
    it 'gets product price_base' do
      expect(@product.price_base).to eql(2299.0)
      expect(@product_last.price_base).to eql(2399.0)
    end
  end

  describe '#price_no_vat' do
    it 'gets product price_no_vat' do
      expect(@product.price_no_vat).to eql(1900.0)
      expect(@product_last.price_no_vat).to eql(1982.644628)
    end
  end

  describe '#price_vat' do
    it 'gets product price_vat' do
      expect(@product.price_vat).to eql(2299.0)
      expect(@product_last.price_vat).to eql(2399.0)
    end
  end

  describe '#stock' do
    it 'gets product stock' do
      expect(@product.stock).to eql(0.0)
      expect(@product_last.stock).to eql(1.0)
    end
  end

  describe '#note' do
    it 'gets product note' do
      expect(@product.note).to eql('NENÍ FOTO')
      expect(@product_last.note).to eql('NENÍ FOTO')
    end
  end

  describe '#description' do
    it 'gets product description' do
      expect(@product.description).to eql('')
      expect(@product_last.description).to eql('')
    end
  end

  describe '#ean' do
    it 'gets product ean' do
      expect(@product.ean).to eql('')
      expect(@product_last.ean).to eql('')
    end
  end

  describe '#vat' do
    it 'gets product vat' do
      expect(@product.vat).to eql(21.0)
      expect(@product_last.vat).to eql(21.0)
    end
  end
end
