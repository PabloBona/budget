require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = build(:user, name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with a name longer than 50 characters' do
    user = build(:user, name: 'a' * 51)
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with an email longer than 255 characters' do
    user = build(:user, email: "#{'a' * 244}@example.com")
    expect(user).to_not be_valid
  end

  it 'has many categories' do
    association = described_class.reflect_on_association(:categories)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many payments as an author' do
    association = described_class.reflect_on_association(:payments)
    expect(association.macro).to eq(:has_many)
  end
end
