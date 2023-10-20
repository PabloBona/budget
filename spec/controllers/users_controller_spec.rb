require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  describe 'GET #index' do
    it 'renders the index template' do
      sign_in user
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @users' do
      sign_in user
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'GET #show' do
    it 'assigns @user' do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end
end
