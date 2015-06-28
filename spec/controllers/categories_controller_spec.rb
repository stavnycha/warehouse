require 'rails_helper'


describe CategoriesController do
  
  before do
    allow_any_instance_of(described_class).to receive(:authenticate_user!)
  end
  
  let(:attributes) { { name: 'Category1' } }

  describe 'index' do
    describe 'sorting' do
      let(:params) { { sort: 'name', direction: 'desc' } }
      subject      { get :index, params }
      let!(:cat1)  { Category.create! name: 'a' }
      let!(:cat2)  { Category.create! name: 'b' }

      it 'should return correct sorting' do
        expect{ subject }.to change{ assigns(:categories) }.to([cat2, cat1])
      end
    end
  end

  describe '#create' do

    context 'category has unique name' do
      it "creates a new category" do
        expect {
          post :create, {:category => attributes}
        }.to change(Category, :count).by(1)
      end
    end

    context 'category already exists' do
      before do
        Category.create!(attributes)
      end

      it "doesnt create new category" do
        expect {
          post :create, {:category => attributes}
        }.to_not change(Category, :count).from(1)
      end

      it "stays on same creation page" do
        post :create, {:category => attributes}
        expect(response).to render_template("new")
      end
    end
    
  end

  describe '#destroy' do
    
    let!(:category) { Category.create!(attributes) }

    it "destroys the requested category" do
      expect {
        delete :destroy, {:id => category.id}
      }.to change(Category, :count).to(0)
    end

    it "redirects to the categories list" do
      delete :destroy, {:id => category.id}
      expect(response).to redirect_to(categories_url)
    end
  end
end