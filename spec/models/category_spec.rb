require 'rails_helper'


describe Category do
  let(:name) { 'Name' }
  let(:params) { {name: name} }

  describe '#create!' do
    context 'no name given' do
      it 'should raise an exception' do
        expect{ described_class.create!({})}.to raise_error
      end
    end

    context 'not unique name given' do
      before { Category.create! params }
      
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

  describe '::search' do
    let(:search)    { name.upcase }
    let!(:category) { Category.create! params }

    it 'should search case insensitive' do
      expect(described_class.search(search)).to eq([category])
    end
  end
end