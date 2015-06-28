require 'rails_helper'


describe Product::Searcher do
  let(:name)   { 'Name' }
  let(:price)  { 10 } 
  let(:params) { { name: name, price: price } }

  describe '::search' do
    let(:search)    { { query: name.upcase } }

    context 'Search matches product name' do
      let!(:product) { Product.create! params.merge(name: search) }

      it 'should find the product' do
        expect(described_class.search(search)).to eq([product])
      end
    end

    context 'Search matches product description' do
      let!(:product) { Product.create! params.merge(description: search) }

      it 'should find the product' do
        expect(described_class.search(search)).to eq([product])
      end
    end

    describe 'search by category' do
      let(:cat_name)  { 'Category' }
      let(:category)  { Category.create! name: cat_name }
      let(:product)   { Product.create! params }
      let(:search)    { { category: cat_name } }

      before do
        product.categories = [category]
      end

      it 'should find the product' do
        expect(described_class.search(search)).to eq([product])
      end
    end
  end
end