describe Flexibee::Node, vcr: true do
  before do
    VCR.use_cassette 'tree/api_response' do
      @node ||= @flexibee.tree.all.first
      @node_last ||= @flexibee.tree.all.last
    end
  end

  describe '#initialize' do
    it 'gets basic node response' do
      expect(@node).to be_an(Flexibee::Node)
      expect(@node_last).to be_an(Flexibee::Node)
    end
  end

  describe '#id' do
    it 'gets node id' do
      expect(@node.id).to eql(1)
      expect(@node_last.id).to eql(125)
    end
  end

  describe '#updated_at' do
    it 'gets node updated_at' do
      expect(@node.updated_at).to eql('2015-05-28T09:40:11.971+02:00')
      expect(@node_last.updated_at).to eql('2015-12-07T13:41:33.290+01:00')
    end
  end

  describe '#code' do
    it 'gets node code' do
      expect(@node.code).to eql('STR_CEN')
      expect(@node_last.code).to eql('Dárkové poukazy')
    end
  end

  describe '#name' do
    it 'gets node name' do
      expect(@node.name).to eql('Strom ceníku')
      expect(@node_last.name).to eql('Dárkové poukazy')
    end
  end

  describe '#level' do
    it 'gets node level' do
      expect(@node.level).to eql(1)
      expect(@node_last.level).to eql(4)
    end
  end

  describe '#order' do
    it 'gets node order' do
      expect(@node.order).to eql(1)
      expect(@node_last.order).to eql(14)
    end
  end

  describe '#route' do
    it 'gets node route' do
      expect(@node.route).to eql('1/')
      expect(@node_last.route).to eql('1/1/3/14/')
    end
  end

  describe '#short_description' do
    it 'gets node short_description' do
      expect(@node.short_description).to be_empty
      expect(@node_last.short_description).to be_empty
    end
  end

  describe '#keywords' do
    it 'gets node keywords' do
      expect(@node.keywords).to be_empty
      expect(@node_last.keywords).to be_empty
    end
  end

  describe '#description' do
    it 'gets node description' do
      expect(@node.description).to be_empty
      expect(@node_last.description).to be_empty
    end
  end

  describe '#tree_ref' do
    it 'gets node tree_ref' do
      expect(@node.tree_ref).to eql('/c/woodies/strom-koren/1.json')
      expect(@node_last.tree_ref).to eql('/c/woodies/strom-koren/1.json')
    end
  end

  describe '#parent_id' do
    it 'gets node parent_id' do
      expect(@node.parent_id).to eql(0)
      expect(@node_last.parent_id).to eql(10)
    end
  end

  describe '#parent_ref' do
    it 'gets node parent_ref' do
      expect(@node.parent_ref).to be_nil
      expect(@node_last.parent_ref).to eql('/c/woodies/strom/10.json')
    end
  end

  describe '#descendants' do
    it 'gets descendants of current node' do
      VCR.use_cassette 'node/api_response_descendants' do
        expect(@node.descendants).to all( be_an(Flexibee::Node) )
        expect(@node.descendants).to all( have_attributes(parent_id: @node.id) )
        expect(@node.descendants).to all( have_attributes(level: @node.level+1) )

        expect(@node_last.descendants).to be_empty
      end
    end
  end

  describe '#parent' do
    it 'gets parent of the node' do
      VCR.use_cassette 'node/api_response_parent' do
        expect(@node.parent).to be_nil

        expect(@node_last.parent).to be_an(Flexibee::Node)
        expect(@node_last.parent.level).to eql(@node_last.level-1)
        expect(@node_last.parent_id).to eql(@node_last.parent_id)
      end
    end
  end
end
