# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { build(:user) }
  describe 'Validations' do
    it do 
      is_expected.to validate_presence_of(:name) 
       debugger
    end
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:lastname) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
  end

  describe 'Factory' do
    it 'Factory valid' do
      expect(build(:user)).to be_valid
    end
  end
end
