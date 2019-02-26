require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:location) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
  end
end
