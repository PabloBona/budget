require 'rails_helper'

describe "Visit the new payments page", type: :feature do
  # Logged in user and category
  before do
    user = FactoryBot.create(:user)
    login_as(user)
    @category = FactoryBot.create(:category, user: user)
    @categories = [ @category ] # For the select dropdown options
    @payment = FactoryBot.build(:payment) # A new payment object to populate the form
    visit new_category_payment_path(@category)
  end

  it '1 should display the title of the page' do
    expect(page).to have_content 'NEW PAYMENTS'
  end

  it '2 should display the payment form' do
    expect(page).to have_selector('form')
  end

  it '3 should display form fields' do
    expect(page).to have_field('Amount', type: 'text')
    expect(page).to have_field('Payment Name', type: 'text')
  end

  it '4 should display validation errors' do
    click_button 'Create Payment' # Assuming the button text is 'Create Payment'
    expect(page).to have_content("Amount can't be blank")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Category ids can't be blank")
  end

  it '6 should redirect to root path after logout' do
    click_button 'Logout'
    expect(page).to have_current_path(root_path)
  end
end
