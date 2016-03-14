describe Flexibee::Tree, vcr: true do
  before do
    VCR.use_cassette 'tree/api_response' do
      @tree = @flexibee.tree
    end
  end


  describe '#initialize' do
    it 'gets basic tree response' do
      VCR.use_cassette 'tree/api_response' do
        expect(@tree.all).not_to be_empty
        expect(@tree.all).to all( be_an(Flexibee::Node) )
      end
    end
  end

  describe '#root' do
    it 'gets root node of the tree' do
      VCR.use_cassette 'tree/api_response_root' do
        root = @tree.root
        expect(root.level).to eql(1)
      end
    end
  end

  describe '#level' do
    it 'gets basic level response (root)' do
      VCR.use_cassette 'tree/api_response_level' do
        level = @tree.level
        expect(level).to all( be_an(Flexibee::Node) )
        expect(level).to all( have_attributes(level: 1) )
      end
    end

    it 'gets level 3 response' do
      VCR.use_cassette 'tree/api_response_level_three' do
        level = @tree.level(3)
        expect(level).to all( be_an(Flexibee::Node) )
        expect(level).to all( have_attributes(level: 3) )
      end
    end
  end

  describe '#children_of' do
    it 'gets descendants of given node' do
      VCR.use_cassette 'tree/api_response_descendants_first' do
        expect(@tree.children_of(@tree.all.first.id)).to all( be_an(Flexibee::Node) )
        expect(@tree.children_of(@tree.all.first.id)).to all( have_attributes(level: @tree.all.first.level+1) )
      end
      VCR.use_cassette 'tree/api_response_descendants_last' do
        expect(@tree.children_of(@tree.all.last.id)).to be_empty
      end
    end
  end

  describe '#parent_for' do
    it 'gets root node of the tree' do
      VCR.use_cassette 'tree/api_response' do
        @last = @tree.all.last
        @first = @tree.all.first
      end
      VCR.use_cassette 'tree/api_response_parent_last' do
        expect(@tree.parent_for(@last.parent_id)).to all( be_an(Flexibee::Node) )
        expect(@tree.parent_for(@last.parent_id)).to all( have_attributes(level: @last.level-1) )
      end
      VCR.use_cassette 'tree/api_response_parent_first' do
        expect(@tree.parent_for(@first.parent_id)).to be_empty
      end
    end
  end
end
