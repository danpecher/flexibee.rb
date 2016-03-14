describe Flexibee::Company, vcr: true do
  describe '#info' do
    it 'gets all the company information' do
      VCR.use_cassette 'company/api_response' do
        expect(@flexibee.company.info).
          to eql({
            'createDt' => '2016-03-10T14:07:42.673+01:00',
            'dbNazev' => 'woodies',
            'id' => '1',
            'licenseGroup' => '04fc91491a9647d451649736ad8127e2',
            'nazev' => 'woodies_test',
            'show' => 'true',
            'stavEnum' => 'ESTABLISHED',
            'watchingChanges' => 'false' })
      end
    end
  end

  describe '#db_name' do
    it 'gets only company DB name' do
      VCR.use_cassette 'company/api_response' do
        expect(@flexibee.company.db_name).to eql('woodies')
      end
    end
  end

  describe '#name' do
    it 'gets only company name' do
      VCR.use_cassette 'company/api_response' do
        expect(@flexibee.company.name).to eql('woodies_test')
      end
    end
  end

  describe '#id' do
    it 'gets only company id' do
      VCR.use_cassette 'company/api_response' do
        expect(@flexibee.company.id).to eql('1')
      end
    end
  end

  describe '#created_at' do
    it 'gets only company created_at' do
      VCR.use_cassette 'company/api_response' do
        expect(@flexibee.company.created_at).to eql('2016-03-10T14:07:42.673+01:00')
      end
    end
  end
end
