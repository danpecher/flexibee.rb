describe Flexibee::Client do
  describe '#initialize' do
    it 'sucessfully initializes Flexibee::Client object' do
      user_id = 'pecher'
      login = 'danpecher'
      password = 'hesloheslo'
      company = 'esperia_test'

      flexibee = Flexibee::Client.new(user_id, login, password, company)

      expect(flexibee).to be_kind_of Flexibee::Client
    end
  end
end
