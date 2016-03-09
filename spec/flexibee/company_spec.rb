describe Flexibee::Company, vcr: true do
  describe '#info' do
    it 'gets all the company information' do
      VCR.use_cassette 'client/api_response' do
        expect(@flexibee.company.info).
          to eql({
            'createDt' => '2015-10-17T18:26:39.692+02:00',
            'dbNazev' => 'esperia_test',
            'id' => '1',
            'licenseGroup' => '04fc91491a9647d451649736ad8127e2',
            'nazev' => 'esperia-test',
            'show' => 'true',
            'stavEnum' => 'ESTABLISHED',
            'watchingChanges' => 'false' })
      end
    end
  end

  describe '#db_name' do
    it 'gets only company DB name' do
      VCR.use_cassette 'client/api_response' do
        expect(@flexibee.company.db_name).to eql('esperia_test')
      end
    end
  end

  describe '#name' do
    it 'gets only company name' do
      VCR.use_cassette 'client/api_response' do
        expect(@flexibee.company.name).to eql('esperia-test')
      end
    end
  end

  describe '#id' do
    it 'gets only company id' do
      VCR.use_cassette 'client/api_response' do
        expect(@flexibee.company.id).to eql('1')
      end
    end
  end

  describe '#created_at' do
    it 'gets only company created_at' do
      VCR.use_cassette 'client/api_response' do
        expect(@flexibee.company.created_at).to eql('2015-10-17T18:26:39.692+02:00')
      end
    end
  end
end
