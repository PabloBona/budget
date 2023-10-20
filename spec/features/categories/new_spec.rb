require 'rails_helper'

describe "Visit the index page of 'categories'", type: :feature do
  before do
    user = FactoryBot.create(:user)
    FactoryBot.create(:category, user:, name: 'Food')
    login_as(user)
  end

  it 'should display the title of the page' do
    visit categories_path
    expect(page).to have_content 'CATEGORIES'
  end

  it "should display the 'Add a New Category' button" do
    visit categories_path
    expect(page).to have_selector('.btn-green', text: 'Add a New Category')
  end

  it 'should display the categories' do
    visit categories_path
    expect(page).to have_selector('.zoom-on-hover')
  end

  it "Clicking on the 'Add a New Category' button should redirect to categories' new page" do
    visit categories_path
    click_link 'Add a New Category'
    expect(page).to have_current_path(new_category_path)
  end
end
