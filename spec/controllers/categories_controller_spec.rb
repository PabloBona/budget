# spec/controllers/categories_controller_spec.rb
require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns @categories' do
      get :index
      expect(assigns(:categories)).to eq([category])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'assigns a new category to @category' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new category' do
        expect do
          post :create, params: { category: attributes_for(:category) }
        end.to change(Category, :count).by(1)
      end

      it 'redirects to root path' do
        post :create, params: { category: attributes_for(:category) }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new category' do
        expect do
          post :create, params: { category: attributes_for(:category, name: nil) }
        end.to_not change(Category, :count)
      end

      it 're-renders the new template' do
        post :create, params: { category: attributes_for(:category, name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end
end
