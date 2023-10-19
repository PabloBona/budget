require 'rails_helper'

describe "Visit the index page of 'payments'", type: :feature do
  # Logged in user and categories
  before do
    user = FactoryBot.create(:user)
    login_as(user)

    # Crear una categoría y asociar algunos pagos a ella
    @category = FactoryBot.create(:category, user: user)
    @payments = FactoryBot.create_list(:payment, 5, author: user)
    @category.payments << @payments

    visit category_payments_path(@category)
  end

  it ' should display the title of the page' do
    expect(page).to have_content 'PAYMENTS'
  end

  it " should display the 'New Payment' button" do
    expect(page).to have_selector('.btn-green', text: 'Add a New Transaction')
  end

  it ' should have logout button that logs out the user' do
    expect(page).to have_button('Logout')
    click_button('Logout')
    expect(page).to have_current_path(root_path)
  end

  it ' should redirect to new payment page when clicking on Add a New Transaction button' do
    click_link 'Add a New Transaction'
    expect(page).to have_current_path(new_category_payment_path(@category))
  end
end
