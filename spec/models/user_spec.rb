# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:lastname) }
    it { is_expected.to validate_length_of(:password).is_at_least(3) }
  end

  describe 'Format' do
    it { is_expected.not_to allow_value('nicolas123').for(:name) }
    it { is_expected.to allow_value('nicolas').for(:name) }
    it { is_expected.not_to allow_value('gar123').for(:lastname) }
    it { is_expected.to allow_value('garci').for(:lastname) }
    it { is_expected.not_to allow_value('gar%').for(:lastname) }
    it { is_expected.not_to allow_value('ga').for(:password) }
    it { is_expected.to allow_value('gar%45as').for(:password) }
  end

  describe 'Factory' do
    it { expect(subject).to be_valid }
  end
end
