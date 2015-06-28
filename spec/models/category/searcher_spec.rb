require 'rails_helper'


describe Category::Searcher do
  let(:name) { 'Name' }
  let(:params) { {name: name} }

  describe '::search' do
    let(:search)    { { query: name.upcase } }
    let!(:category) { Category.create! params }

    it 'should search case insensitive' do
      expect(described_class.search(search)).to eq([category])
    end
  end
end