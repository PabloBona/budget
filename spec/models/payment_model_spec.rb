require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }

  it 'is valid with valid attributes' do
    payment = build(:payment, author: user, categories: [category])
    expect(payment).to be_valid
  end

  it 'is not valid without an amount' do
    payment = build(:payment, amount: nil, author: user, categories: [category])
    expect(payment).to_not be_valid
  end

  it 'is not valid without a name' do
    payment = build(:payment, name: nil, author: user, categories: [category])
    expect(payment).to_not be_valid
  end

  it 'is not valid without associated categories' do
    payment = build(:payment, author: user, categories: [])
    expect(payment).to_not be_valid
  end

  it 'belongs to an author (user)' do
    association = described_class.reflect_on_association(:author)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'has many payment categories' do
    association = described_class.reflect_on_association(:payment_categories)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many categories through payment categories' do
    association = described_class.reflect_on_association(:categories)
    expect(association.macro).to eq(:has_many)
  end
end
