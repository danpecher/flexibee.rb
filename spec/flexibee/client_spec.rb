describe Flexibee::Client, vcr: true do
  describe '#initialize' do
    it 'sucessfully initializes Flexibee::Client object' do
      expect(@flexibee).to be_kind_of Flexibee::Client
    end
  end

  describe '#base_url' do
    it 'correctly aseembles API URL' do
      expect(@flexibee.base_url).to eql("https://danpecher:hesloheslo@pecher.flexibee.eu:5434/c/woodies")
    end
  end

  describe '#get' do
    it 'gets a response from an api' do
      VCR.use_cassette 'client/api_response' do
        response = @flexibee.get(@flexibee.base_url)
        expect(response).to include('companies')
      end
    end
  end

  describe '#base_response' do
    it 'gets basic response from an api' do
      VCR.use_cassette 'client/api_response' do
        expect(@flexibee.base_response).to eql({
          "companies" => {
            "company" => {
              "createDt" => "2016-03-10T14:07:42.673+01:00",
              "dbNazev" => "woodies",
              "id" => "1",
              "licenseGroup" => "04fc91491a9647d451649736ad8127e2",
              "nazev" => "woodies_test",
              "show" => "true",
              "stavEnum" => "ESTABLISHED",
              "watchingChanges" => "false"
            }
          }
        })
      end
    end
  end
end
