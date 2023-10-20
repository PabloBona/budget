require 'rails_helper'

describe "Visit the index page of 'categories'", type: :feature do
  # Logged in before running the tests
  before do
    user = FactoryBot.create(:user)
    login_as(user)
    @categories = FactoryBot.create_list(:category, 5, user:)
    visit categories_path
  end

  it 'should display the title of the page' do
    expect(page).to have_content 'CATEGORIES'
  end

  it "should display the 'Add a New Category' button" do
    expect(page).to have_link('Add a New Category', href: new_category_path)
  end

  it 'should display the categories' do
    @categories.each do |category|
      within("#category_#{category.id}") do
        expect(page).to have_content(category.name)
      end
    end
  end

  it 'Clicking on a category should redirect to its payments page' do
    category = @categories.first
    within("#category_#{category.id}") do
      click_link category.name
    end
    expect(page).to have_current_path(category_payments_path(category))
  end

  it "Clicking on the 'Add a New Category' button should redirect to the new category page" do
    click_link 'Add a New Category'
    expect(page).to have_current_path(new_category_path)
  end
end
