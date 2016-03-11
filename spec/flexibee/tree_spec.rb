describe Flexibee::Tree, vcr: true do
  before do
    VCR.use_cassette 'tree/api_response' do
      @tree = @flexibee.tree
    end
  end

  describe '#initialize' do
    it 'gets basic tree response' do
      expect(@tree.nodes).not_to be_empty
      expect(@tree.nodes).to all( be_an(Flexibee::Node) )
    end
  end

  describe '#root' do
    it 'gets root node of the tree' do
      root = @tree.root
      expect(root.level).to eql(1)
    end
  end

  describe '#level' do
    it 'gets basic level response (root)' do
      level = @tree.level(3)
      expect(level).to all( be_an(Flexibee::Node) )
      expect(level).to all( have_attributes(level: 3) )
    end
  end
end
