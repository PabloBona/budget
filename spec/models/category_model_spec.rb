require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    category = build(:category, user:)
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = build(:category, user:, name: nil)
    expect(category).to_not be_valid
  end

  it 'is not valid with a name longer than 10 characters' do
    category = build(:category, user:, name: 'ThisIsTooLongName')
    expect(category).to_not be_valid
  end

  it 'is not valid without an icon' do
    category = build(:category, user:, icon: nil)
    expect(category).to_not be_valid
  end

  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'has many payment categories' do
    association = described_class.reflect_on_association(:payment_categories)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many payments through payment categories' do
    association = described_class.reflect_on_association(:payments)
    expect(association.macro).to eq(:has_many)
  end
end
