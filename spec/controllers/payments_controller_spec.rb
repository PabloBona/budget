require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }
  let(:valid_attributes) { attributes_for(:payment, category_ids: [category.id]) }
  let(:invalid_attributes) { attributes_for(:payment, amount: nil) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index, params: { category_id: category.id }
      expect(response).to render_template(:index)
    end

    it 'assigns @payments and @total_amount' do
      payment = create(:payment, category_ids: [category.id], author: user)
      get :index, params: { category_id: category.id }
      expect(assigns(:payments)).to eq([payment])
      expect(assigns(:total_amount)).to eq(payment.amount)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new, params: { category_id: category.id }
      expect(response).to render_template(:new)
    end

    it 'assigns @payment and @categories' do
      get :new, params: { category_id: category.id }
      expect(assigns(:payment)).to be_a_new(Payment)
      expect(assigns(:categories)).to eq([category])
  end

    context 'with invalid attributes' do
      it 'does not save the new payment' do
        expect do
          post :create, params: { category_id: category.id, payment: invalid_attributes }
        end.to_not change(Payment, :count)
      end

      it 're-renders the new template' do
        post :create, params: { category_id: category.id, payment: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end
end
