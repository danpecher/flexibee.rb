describe Flexibee::Client, vcr: true do
  describe '#initialize' do
    it 'sucessfully initializes Flexibee::Client object' do
      expect(@flexibee).to be_kind_of Flexibee::Client
    end
  end

  describe '#base_url' do
    it 'correctly aseembles API URL' do
      expect(@flexibee.base_url).to eql("https://danpecher:hesloheslo@pecher.flexibee.eu:5434/c/esperia_test")
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
              "createDt" => "2015-10-17T18:26:39.692+02:00",
              "dbNazev" => "esperia_test",
              "id" => "1",
              "licenseGroup" => "04fc91491a9647d451649736ad8127e2",
              "nazev" => "esperia-test",
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
