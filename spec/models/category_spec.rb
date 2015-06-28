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
end