require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'relationships' do
    it { should have_many(:favorites) }
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
  end
end
