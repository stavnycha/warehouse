require 'rails_helper'


describe ProductsController do
  
  before do
    allow_any_instance_of(described_class).to receive(:authenticate_user!)
  end
  
  let(:attributes) { { name: 'Product1', price: 10 } }

  describe 'index' do
    let!(:p1)  { Product.create! attributes.merge(name: 'a') }
    let!(:p2)  { Product.create! attributes.merge(name: 'b') }

    subject     { get :index, params }

    describe 'sorting' do
      let(:params) { { sort: 'name', direction: 'desc' } }

      it 'should return correct sorting' do
        expect{ subject }.to change{ assigns(:products) }.to([p2, p1])
      end
    end

    describe 'filtering' do
      context 'filtering category' do
        let(:cat_name) { 'Category' }
        let(:category) { Category.create!(name: cat_name) }   
        let(:params)   { { search: { category: cat_name } } }
        
        before do
          p1.categories = [category]
        end

        it 'should return products of given category only' do
          expect{ subject }.to change{ assigns(:products) }.to([p1])
        end
      end
    end

    context 'search' do
      let(:params)   { { search: { query: 'a' } } }

      it 'should return products where there is title or descr match' do
        expect{ subject }.to change{ assigns(:products) }.to([p1])
      end
    end
  end
end