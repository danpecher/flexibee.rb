describe Flexibee::Tree, vcr: true do
  describe '#initialize' do
    it 'gets basic tree response' do
      VCR.use_cassette 'tree/api_response' do
        tree = @flexibee.tree
        expect(tree.nodes).not_to be_empty
        expect(tree.nodes).to all( be_an(Flexibee::Node) )
      end
    end
  end

  describe '#root' do
    it 'gets basic tree response' do
      VCR.use_cassette 'tree/api_response' do
        root = @flexibee.tree.root
        
      end
    end
  end
end
