require 'rails_helper'


describe Product do
  let(:name)   { 'Name' }
  let(:price)  { 10 } 
  let(:params) { { name: name, price: price } }

  describe '#create!' do
    context 'no name given' do
      before { params[:name] = nil }
      it 'should raise an exception' do

        expect{ described_class.create! params}.to raise_error
      end
    end

    context 'no price given' do
      before { params[:price] = nil }
      it 'should raise an exception' do
        expect{ described_class.create! params}.to raise_error
      end
    end

    context 'valid parameter given' do
      it 'should not raise an exception' do
        expect{ described_class.create! params}.not_to raise_error
      end
    end
  end

  describe '#picture_url' do
    context 'no picture added' do
      let(:product) { Product.create! params }
      
      it 'should have default picture' do
        expect(product.picture_url).to be_a(String)
      end

      it 'should have default thumbnail' do
        expect(product.picture.thumb.url).to be_a(String)
      end
    end
  end

  describe '::search' do
    let(:search)    { name.upcase }

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
  end
end